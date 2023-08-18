import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ekikrit/Common/utils/GetDio.dart';
import 'package:ekikrit/Common/utils/PreferenceManager.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:ekikrit/Common/utils/custom_navigator.dart';
import 'package:ekikrit/Consumer/Profile/Controller/ProfileController.dart';
import 'package:ekikrit/Consumer/Profile/Model/ProfileResponseModel.dart';
import 'package:ekikrit/Consumer/Profile/Networking/ProfileApi.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';

import 'package:ekikrit/onBoarding/data_model/CountryCodeModel.dart';
import 'package:ekikrit/onBoarding/data_model/SendOtpResponseModel.dart';
import 'package:ekikrit/onBoarding/data_model/VerifyOtpResponseModel.dart';
import 'package:ekikrit/onBoarding/data_model/registration_data_model.dart';
import 'package:ekikrit/onBoarding/data_model/verify_profile_data_model.dart';
import 'package:ekikrit/onBoarding/networking/auth_api_calls.dart';
import 'package:ekikrit/onBoarding/pages/registration_successful.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
// import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio_lib;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

class AuthController extends GetxController with StateMixin {

  RxBool isLoading = false.obs;
  RxBool isLogoutLoading = false.obs;
  RxBool isUpdateAvailable = false.obs;
  RxBool isSendingOTP = false.obs;
  RxBool isLoadingCountries = false.obs;
  RxBool showOTPButton = false.obs;
  RxString? gReCaptchaToken = ''.obs;
  RxBool isAccountDeactivate = false.obs;
  RxInt start = 30.obs;
  RxBool allowRetry = false.obs;
  late Timer timer;
  RxList<CountryCodeModel> countryList = <CountryCodeModel>[].obs;
  RxList<CountryCodeModel> filteredList = <CountryCodeModel>[].obs;
  ProfileController profileController = Get.put(ProfileController());

  @override
  void onInit() {
    super.onInit();
  }

  linkIdentity({jsonParam})async{
    var data = await AuthenticationApi().linkAccount(
        jsonParam: jsonParam
    );
    print('data>>> $data');
    if(data != null) {
      ShowMessages().showSnackBarGreen("Congratulations!!!", "Your indentity has been linked with your Ekikrit account" );
      CustomNavigator.pushReplace(Routes.CONSUMER_HOME);
    }else{
      ShowMessages().showSnackBarRed("Oops!!!", "Something went wrong! Please try again later." );
    }
  }

  userRegistration({jsonParam,enteredPhone})async{
    var data = await AuthenticationApi().registerUser(
      jsonParam: jsonParam
    );
    print('data>>> $data');
    if(data != null) {
      RegistrationDataModel resResponseModel = data;
      PreferenceManager().saveProfileId(profileID:resResponseModel.response!.profile!.id);
      CustomNavigator.pushReplace(Routes.VERIFY_OTP,arguments: {'phone': enteredPhone,'isRegistered': 'true'});
    }
  }

  disableLoader() async {
    Future.delayed(const Duration(milliseconds: 500), () {
      isLoading.value = false;
    });
  }

  sendOTP({email,isWeb}) async {
    isLoading.value = true;
    isSendingOTP.value = true;
    var uuid = const Uuid();
    // to do check if user is generated already
    PreferenceManager().saveUniqueId(uniqueId: uuid.v1());
    var data = await AuthenticationApi().sendOTP(
        email: email,
        captchaToken: gReCaptchaToken!.value,
    );
    print('data>>> $data');
    if (data != null) {
      if(data.statusCode == 'OK') {
      // SendOtpResponseModel sendOtpResponseModel = data;
      CustomNavigator.pushTo(Routes.VERIFY_OTP, arguments: {'email': email,'isRegistered': 'false'});
      if(!isWeb) {
        Future.delayed(const Duration(milliseconds: 500), () {
          disableLoader();
          isSendingOTP.value = false;
        });
      }else {
        CustomNavigator.pushTo(Routes.VERIFY_OTP,
            arguments: {'email': email,'isRegistered': 'false'});
      }
      }else{
        ShowMessages()
            .showSnackBarRed("Oops!!!", "$data");
      }
    } else {
      ShowMessages()
          .showSnackBarRed("Oops!!!", "User Account is Locked for 24 hours");
    }
    isLoading.value = false;
    isSendingOTP.value = false;
  }

  resendOTP({phone}) async {
    isLoading.value = true;
    isSendingOTP.value = true;
    // var uuid = const Uuid();
    // PreferenceManager().saveUniqueId(uniqueId: uuid.v1());
    var data = await AuthenticationApi().resendOTP(
        phone: phone,
        captchaToken: gReCaptchaToken!.value,

    );
    if (data != null) {
      SendOtpResponseModel sendOtpResponseModel = data;
      ShowMessages().showSnackBarRed("Success", "Confirmation code has been sent again");
      Future.delayed(const Duration(milliseconds: 500), () {
        disableLoader();
        isSendingOTP.value = false;
        allowRetry.value = false;
        start.value = 30;
        startTimer();
      });
    } else {
      ShowMessages()
          .showSnackBarRed("Error!", "Error occurred while sending OTP!!!");
    }
  }

  verifyProfile({phone, otp}) async {
    isLoading.value = true;
    var data = await AuthenticationApi().verifyProfile(
      phone: phone,
      otp: otp,
    );
    if (data != null) {
      VerifyProfileDataModel verifyOtpResponseModel = data;
      print('verifyOtp>>> ${verifyOtpResponseModel.response!.profile!.name!.firstName}');
      PreferenceManager().savePhone(phone: phone);
      Get.to(RegistrationSuccessful());

    }
    isLoading.value = false;
  }

  verifyOTP({email, otp}) async {
    isLoading.value = true;
    var data = await AuthenticationApi().verifyOTP(
      email: email,
      otp: otp,
    );
    // print('verifyOtp>>> ${verifyOtpResponseModel.verifyResponse.token}');
    if (data != null) {
      VerifyOtpResponseModel verifyOtpResponseModel = data;
      PreferenceManager().saveLogin(
        isLoggedIn: true,
      );
      print('verifyOtp>>> ${verifyOtpResponseModel.verifyResponse.token}');
      // PreferenceManager().savePhone(phone: phone);
      PreferenceManager().saveEmail(eMail: email);
      PreferenceManager().saveToken(token: verifyOtpResponseModel.verifyResponse.token);
      handleProfile();
    }
    isLoading.value = false;
  }
  handleProfile() async {
    isLoading.value = true;
    var profileData = await ProfileApi().getProfile();
    print('profileData>>> $profileData');
    if (profileData != null) {
      if (profileData == "No Content") {
        CustomNavigator.pushReplace(Routes.REGISTRATION);
      }
      else {
        ProfileResponseModel profileResponseModel = profileData;

        PreferenceManager().saveProfileId(
            profileID: profileResponseModel.data!.profile!.id!);
        PreferenceManager().saveProfileName(
            profileName:
            '${profileResponseModel.data!.profile!.name!.firstName!} ${profileResponseModel.data!.profile!.name!.lastName!}');
        PreferenceManager().saveEmail(
            eMail: profileResponseModel.data!.profile!.phone!.number!);
        CustomNavigator.pushReplace(Routes.CONSUMER_HOME);
        disableLoader();
      }
    } else {
      CustomNavigator.pushReplace(Routes.REGISTRATION);
      disableLoader();
    }
  }

  startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 1) {
          timer.cancel();
          allowRetry.value = true;
        } else {
          start.value--;
        }
      },
    );
  }


  logOut() async {
    await callLogout();
  }
  callLogout() async{
    // isLogoutLoading.value =true;
    var data = await AuthenticationApi().logout();
    print('data>logout>> $data');
    showOTPButton.value = false;
    if (!kIsWeb){
      await GoogleSignIn().signOut();
    }
    PreferenceManager().saveLogin(
      isLoggedIn: false,

    );
    PreferenceManager().saveToken(token: "");
    PreferenceManager().saveProfileId(profileID: "");
    PreferenceManager().saveEmail(eMail: "");
    PreferenceManager().savePhone(phone: "");
    isLogoutLoading.value = false;
    isLoading.value = false;
    CustomNavigator.pushReplace(Routes.LOGIN);
    // }else{
    //   ShowMessages().showSnackBarRed('Oops!!!',
    //       'Your request could not be completed because of an error. Please try again later.');
    // }
    isLogoutLoading.value = false;

  }

  getCountryCodes() async {
    isLoadingCountries.value = true;
    var dio = GetDio().getDio();
    dio_lib.Response response = await dio.get(
        "https://gist.githubusercontent.com/DmytroLisitsyn/1c31186e5b66f1d6c52da6b5c70b12ad/raw/2bc71083a77106afec2ec37cf49d05ee54be1a22/country_dial_info.json");
    List<dynamic> responseArray = jsonDecode(response.data);
    var list = responseArray.map((e) => CountryCodeModel.fromJson(e)).toList();
    countryList.assignAll(list);
    Future.delayed(const Duration(milliseconds: 1500), () {
      isLoadingCountries.value = false;
    });
  }

  checkIfLoggedIn() async {
    bool isLogin = await PreferenceManager().getLogin();
    print('isLogin>>> $isLogin');
    if (isLogin) {
      CustomNavigator.pushReplace(Routes.CONSUMER_HOME);
      // setUpMessaging();
      // getUserRole();
    } else {
      CustomNavigator.pushReplace(Routes.LOGIN);
    }
  }

  showOtp() {
    showOTPButton.value = true;
  }

  hideOtp() {
    showOTPButton.value = false;
  }

  verifyGoogleLogin({
    accessToken,idToken,emailId,userId,clientCode,deviceId,appId
  }) async{
    isLoading.value = true;
    String stJsonParam = '{"accessToken": "$accessToken","emailId": "$emailId","userId": "$userId","clientCode": "$clientCode","deviceId": "$deviceId","appId": "$appId","idToken": "$idToken"}';
    var data = await AuthenticationApi().verifyGoogleLogin(stJsonParam);
    if (data != null) {
      PreferenceManager().saveLogin(
        isLoggedIn: true,
      );
      PreferenceManager().saveEmail(eMail: emailId);
      PreferenceManager()
          .saveToken(token: data);
      handleProfile();
    }
  }

}
