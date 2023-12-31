import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ekikrit/Common/utils/ApiEndPoints.dart';
import 'package:ekikrit/Common/utils/GetDio.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:ekikrit/Consumer/Profile/Model/MinorSearchResponseModel.dart';
import 'package:ekikrit/Consumer/Profile/Model/OtherProfileResponseModel.dart';
import 'package:ekikrit/Consumer/Profile/Model/ProfileResponseModel.dart';
import 'dart:io';

import 'package:ekikrit/onBoarding/data_model/registration_data_model.dart';

class ProfileApi {

  var dio = GetDio().getDio();


  // register User
  Future<dynamic> editUserProfile({jsonParam}) async {
    try {
      print("jsonParam otp >> ${jsonDecode(jsonParam)}");
      print("reSend otp >> ${ApiEndPoints.createProfile}");
      Response response = await dio.put(
          ApiEndPoints.createProfile,
          data: jsonDecode(jsonParam));
      print("Send otp response 43 $response");
      if (response.statusCode == 200) {
        RegistrationDataModel regResponseDataModel =
        RegistrationDataModel.fromJson(response.data);
        return regResponseDataModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred sending otp $e");
      return null;
    }
  }

  // get profile
  Future<dynamic> getProfile() async{
    try {
      Response response = await dio.get(
        "${ApiEndPoints.baseUrl}profile/user/basic-profile",
      );
      print("Get profile URL ${"${ApiEndPoints.baseUrl}profile/user/basic-profile"}");
      print("Get profile response $response");
      if (response.statusCode == 200) {
        ProfileResponseModel profileResponseModel = ProfileResponseModel.fromJson(response.data);
        return profileResponseModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred get profile $e");
      return null;
    }
  }

  // get other user profile
  Future<dynamic> getOtherUserProfile() async{
    try {
      Response response = await dio.get(
        "${ApiEndPoints.baseUrl}profile/user/basic-profile/acting-profile",
      );
      print("Get other profile response $response");
      if (response.statusCode == 200) {
        OtherProfileResponseModel otherProfileResponseModel = OtherProfileResponseModel.fromJson(response.data);
        return otherProfileResponseModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred get other profile $e");
      return null;
    }
  }


  // create proxy
  Future<dynamic> createProxy({email, countryCode, phoneNumber}) async{
    try {
      var postParam = '{ "email": "$email", "phone": { "countryCode": "$countryCode", "number": "$phoneNumber" } }';
      Response response = await dio.post(
        "${ApiEndPoints.baseUrl}profile/user/basic-profile/proxy",
        data: postParam
      );
      print("Create proxy response $response");
      if (response.statusCode == 200) {
        return "ok";
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred create proxy $e");
      return null;
    }
  }


  // search minor
  Future<dynamic> searchMinor({ssn, zipcode, dob}) async{
    try {
      Response response = await dio.get(
          "${ApiEndPoints.baseUrl}profile/user/identity?ssn=$ssn&zipCode=$zipcode&dob=$dob",
      );
      print("Search minor response $response");
      if (response.statusCode == 200) {
        MinorSearchResponseModel minorSearchResponseModel = MinorSearchResponseModel.fromJson(response.data);
        return minorSearchResponseModel;
      }else if (response.statusCode == 204) {
        ShowMessages().showSnackBarRed("No Profile Found", "We could not find any matches with given info");
        return null;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred search minor $e");
      return null;
    }
  }


  // create minor
  Future<dynamic> createMinor({ssn, zipcode, dob}) async{
    try {
      var postParam = '{ "ssn": "$ssn", "zipCode": "$zipcode", "dob": "$dob" }';
      Response response = await dio.post(
          "${ApiEndPoints.baseUrl}profile/user/basic-profile/minor/identity",
          data: postParam
      );
      print("Create proxy response $response");
      if (response.statusCode == 200) {
        return "ok";
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred create minor $e");
      return null;
    }
  }




  // upload image
  Future<bool> uploadImage({filePath}) async{
    var dio = GetDio().getDio();

    File file = File(filePath);
    String fileName = file.path.split('/').last;
    var formData = FormData.fromMap({
      'profileImage=': filePath == "" ? "" : await MultipartFile.fromFile(filePath,filename: fileName),
    });
    print("Uploading image ${fileName}");
    Response response = await dio.post(
        "${ApiEndPoints.baseUrl}profile/user/basic-profile/profile-image",
        data: formData
    );

    print("Response upload image ${response.data}");

    if (response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }



}
