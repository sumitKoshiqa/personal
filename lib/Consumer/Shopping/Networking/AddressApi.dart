import 'package:dio/dio.dart';
import 'package:ekikrit/Common/utils/ApiEndPoints.dart';
import 'package:ekikrit/Common/utils/GetDio.dart';
import 'package:ekikrit/Common/utils/PreferenceManager.dart';
import '../Model/AddressResponseModel.dart';
import '../Model/ProductInventoryInfoModel.dart';


class AddressApi {

  var dio = GetDio().getDio();

  // get addresses
  Future<dynamic> getAddresses() async{
    try {
      Response response = await dio.get(
          "${ApiEndPoints.baseUrl}location/user/user-profile-address/profile/${PreferenceManager().getProfileId()}",
      );
      print("Get address Response $response");
      if (response.statusCode == 200) {
        AddressResponseModel addressResponseModel = AddressResponseModel.fromJson(response.data);
        return addressResponseModel;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred getting address $e");
      return null;
    }
  }

  // save address
  Future<dynamic> saveAddress({name, line1, line2, pinCode, city, state, country, latitude, longitude, mailId, phoneNumber, isDefault}) async{
    try {
      print('{ "name": "$name", "line1": "$line1", "line2": "$line2", "pinCode": "$pinCode", "city": "$city", "state": "$state", "country": "$country", "latitude": "$latitude", "longitude": "$longitude", "mailId": "$mailId", "phoneNumber": "$phoneNumber", "isDefault": $isDefault }');
      var postParam = '{ "name": "$name", "line1": "$line1", "line2": "$line2", "pinCode": "$pinCode", "city": "$city", "state": "$state", "country": "$country", "latitude": "$latitude", "longitude": "$longitude", "mailId": "$mailId", "phoneNumber": "$phoneNumber", "isDefault": $isDefault }';
      Response response = await dio.post(
          "${ApiEndPoints.baseUrl}location/user/user-profile-address/profile/${PreferenceManager().getProfileId()}",
          data: postParam
      );
      print("Save address Response $response");
      if (response.statusCode == 200) {
        return "OK";
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred saving address $e");
      return null;
    }
  }


  // get cities
  Future<dynamic> getCities(url) async{
    try {
      print("Fetching data for in api for $url");
      Response response = await dio.get(url);
      print("Get cities Response $response");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      print("Exception occurred getting cities $e");
      return null;
    }
  }


}
