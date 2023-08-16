import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ekikrit/Common/utils/GetDio.dart';
import 'package:ekikrit/Common/utils/PreferenceManager.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:ekikrit/Common/utils/custom_navigator.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';

import 'package:ekikrit/onBoarding/data_model/CountryCodeModel.dart';
import 'package:ekikrit/onBoarding/networking/auth_api_calls.dart';
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


  @override
  void onInit() {
    super.onInit();
    if(!kIsWeb) {
      // checkVersionUpdate();
    }
    // getCountryCodes();
  }

  userRegistration(String jsonParam)async{
    var data = await AuthenticationApi().registerUser(
      jsonParam: jsonParam
    );
    print('data>>> $data');

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
        isWeb: isWeb
    );
    print('data>>> $data');
    if (data != null) {
      // if(data.statusCode == 'OK') {
      // SendOtpResponseModel sendOtpResponseModel = data;
      // CustomNavigator.pushTo(Routes.VERIFY_OTP, arguments: {'phone': phone});
      if(!isWeb) {
        Future.delayed(const Duration(milliseconds: 500), () {
          disableLoader();
          isSendingOTP.value = false;
        });
      }else {
        // CustomNavigator.pushTo(Routes.VERIFY_OTP,
        //     arguments: {'phone': phone});
      }

      // }else{
      //   ShowMessages()
      //       .showSnackBarRed("Oops!!!", "$data");
      // }
    } else {
      ShowMessages()
          .showSnackBarRed("Oops!!!", "User Account is Locked for 24 hours");
    }
    isLoading.value = false;
    isSendingOTP.value = false;
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
      // setUpMessaging();
      // getUserRole();
    } else {
      CustomNavigator.pushTo(Routes.LOGIN);
    }
  }

  showOtp() {
    showOTPButton.value = true;
  }

  hideOtp() {
    showOTPButton.value = false;
  }


}
