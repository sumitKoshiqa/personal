import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ekikrit/app_entry_point/utils/ApiEndPoints.dart';
import 'package:ekikrit/app_entry_point/utils/GetDio.dart';
import 'package:flutter/foundation.dart';

class AuthenticationApi {
  var dio = GetDio().getDio();

  //Logout
  // Future<dynamic> logout() async {
  //   print(
  //       "Logout from api logout.......................${ApiEndPoints.logoutURL}");
  //   try {
  //     Response response = await dio.get(
  //       ApiEndPoints.logoutURL,
  //     );
  //     print('qwertyu>>logout> ${response.data} ${ApiEndPoints.logoutURL}');
  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print("Exception occurred fetch client id $e");
  //     return false;
  //   }
  // }
  // // resend otp
  // Future<dynamic> resendOTP({phone, captchaToken, isWeb}) async {
  //   try {
  //     String jsonParam =
  //         '{ "clientId": "4283b2dc-df16-4d33-a24f-6537d7a84e07", "clientSecret": "string", "authenticationProviderEnum": "INTERNAL", "authenticationWayEnum": "OTP", "phoneNumber": "", "email": "$phone","deviceId": "${PreferenceManager().getDeviceId()}", "appId": "${PreferenceManager().getUniqueId()}","captchaResponse": "$captchaToken" }';
  //     print("reSend otp >> ${ApiEndPoints.reSendOTP}>>>>> $kIsWeb");
  //     Response response = await dio.post(
  //         (kIsWeb) ? ApiEndPoints.reSendOTP : ApiEndPoints.reSendOTPMobile,
  //         data: jsonParam);
  //     PrintMessage.printMessage("Send otp response $response");
  //     if (response.statusCode == 200) {
  //       SendOtpResponseModel sendOtpResponseModel =
  //       SendOtpResponseModel.fromJson(response.data);
  //       return sendOtpResponseModel;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     PrintMessage.printMessage("Exception occurred sending otp $e");
  //     return null;
  //   }
  // }
  // // send otp
  // Future<dynamic> sendOTP({phone, captchaToken, isWeb}) async {
  //   try {
  //     String jsonParam = '{ "clientId": "4283b2dc-df16-4d33-a24f-6537d7a84e07", "clientSecret": "string", "authenticationProviderEnum": "EMAIL", "authenticationWayEnum": "OTP", "phoneNumber": "String", "email": "$phone","deviceId": "${PreferenceManager().getDeviceId()}", "appId": "${PreferenceManager().getUniqueId()}","captchaResponse": "qwerty" }';
  //     print("Send otp >> ${(isWeb)?ApiEndPoints.sendOTP:ApiEndPoints.sendOTPMobile}");
  //     print("jsonParam >> $jsonParam");
  //     Response response = await dio.post(
  //         (isWeb) ? ApiEndPoints.sendOTP : ApiEndPoints.sendOTPMobile,
  //         data: jsonParam);
  //     PrintMessage.printMessage("Send otp response $response");
  //     if (response.statusCode == 200) {
  //       print('statusCode>>> ${response.data['statusCode']}');
  //       if(response.data['statusCode'] == 'OK') {
  //         SendOtpResponseModel sendOtpResponseModel =
  //         SendOtpResponseModel.fromJson(response.data);
  //         return sendOtpResponseModel;
  //       }else{
  //         return response.data['message'];
  //       }
  //
  //     } else {
  //       return response.data['message'];
  //     }
  //   } catch (e) {
  //     PrintMessage.printMessage("Exception occurred sending otp ${e.toString()}");
  //     return null;
  //   }
  // }
  // // verify otp
  // Future<dynamic> verifyOTP({phone, otp}) async {
  //   print(
  //       'PreferenceManager().getUniqueId()>>> ${PreferenceManager().getUniqueId()}');
  //   try {
  //     String jsonParam =
  //         '{ "authenticationProviderEnum": "EMAIL", "authenticationWayEnum": "OTP", "phoneNumber": "", "email": "$phone","otp": "$otp", "deviceId": "${PreferenceManager().getDeviceId()}", "appId": "${PreferenceManager().getUniqueId()}", "clientId": "4283b2dc-df16-4d33-a24f-6537d7a84e07", "clientSecret": "string" }';
  //     print('jsonParam>>> $jsonParam');
  //     print('ApiEndPoints.verifyOTP>>> ${ApiEndPoints.verifyOTP}');
  //     Response response =
  //     await dio.post(ApiEndPoints.verifyOTP, data: jsonParam);
  //     PrintMessage.printMessage(
  //         "Verify otp response for $phone $otp $response");
  //     if (response.statusCode == 200) {
  //       VerifyOtpResponseModel verifyOtpResponseModel =
  //       VerifyOtpResponseModel.fromJson(response.data);
  //       return verifyOtpResponseModel;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     ShowMessages()
  //         .showSnackBarRed("Invalid OTP", "OTP didn't match. Try again!");
  //     PrintMessage.printMessage("Exception occurred verify otp $e");
  //     return null;
  //   }
  // }
  // // verify Google Cred
  // Future<dynamic> verifyGoogleLogin(jsonParam) async {
  //   try {
  //     Response response =
  //     await dio.post(ApiEndPoints.verifyGoogleLogin, data: jsonParam);
  //     PrintMessage.printMessage("Verify Google response for  $response");
  //     print("Verify Google response for  $response");
  //     if (response.statusCode == 200) {
  //       return response.data['response']['token'];
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     ShowMessages().showSnackBarRed("Invalid Credentials", "Try again!");
  //     PrintMessage.printMessage("Exception occurred verify GoogleLogin $e");
  //     return null;
  //   }
  // }
}
