import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/app_entry_point/utils/GetDio.dart';
import 'package:ekikrit/app_entry_point/utils/PreferenceManager.dart';
import 'package:ekikrit/app_entry_point/utils/custom_navigator.dart';
import 'package:ekikrit/onBoarding/networking/auth_api_calls.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
// import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio_lib;
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


  @override
  void onInit() {
    super.onInit();
    if(!kIsWeb) {
      // checkVersionUpdate();
    }
    // getCountryCodes();
  }

  checkIfLoggedIn() async {
    bool isLogin = await PreferenceManager().getLogin();
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
