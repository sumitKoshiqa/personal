import 'package:dio/dio.dart' as dioLib;
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:ekikrit/app_entry_point/utils/PreferenceManager.dart';


class GetDio {
  dioLib.Dio getDio() {
    String token = PreferenceManager().getToken();
    String profileId = PreferenceManager().getProfileId();
    String deviceId = PreferenceManager().getDeviceId();
    String appId = PreferenceManager().getUniqueId();

    print(
        "My token $token and profile id $profileId and deviceId is $deviceId and appId $appId");

    dioLib.Dio dio = dioLib.Dio();

    // dio.options.connectTimeout = 10000;
    // dio.options.receiveTimeout = 10000;

    // dio.options.headers['X-USER-ID'] = Uuid().v1();
    dio.options.headers["X-ACCESS-TOKEN"] = token;
    dio.options.headers["profileId"] = profileId;
    dio.options.headers["X-PROFILE-ID"] = profileId;
    dio.options.headers["deviceId"] = deviceId;
    dio.options.headers["appId"] = appId;
    dio.options.headers["zoneId"] = "IST";
    dio.options.headers["content-type"] = "application/json";

    // dio.interceptors.add(RetryInterceptor(
    //   dio: dio,
    //   logPrint: print, // specifying log option
    //   retries: 3, // retry count
    //   retryDelays: const [
    //     Duration(seconds: 5),
    //     Duration(seconds: 10),
    //     Duration(seconds: 20),
    //   ],
    // ));

    return dio;
  }

// LogController logController = Get.put(LogController());

  Future<dynamic> get(url, {queryParams, apiName}) async {
    try {
      var dio = getDio();
      dioLib.Response response =
          await dio.get(url, queryParameters: queryParams);
      print("Response from $apiName $response");
      if (response.statusCode == 200) {
        return response;
      }
      return null;
    } catch (e) {
      print("`Networking` Exception occurred $apiName $e");
      if (e is dioLib.DioError) {
        if (e.type == dioLib.DioErrorType.connectTimeout) {
          throw Exception("Connection Timeout Exception");
        } else {
          throw Exception(e.message);
        }
      }
      return null;
    }
  }

//
//
  Future<dynamic> post(url, {queryParams, postParams, apiName}) async {
    try {
      var dio = getDio();
      dioLib.Response response =
          await dio.post(url, queryParameters: queryParams, data: postParams);
      print("Response from $apiName $response");
      // logController.saveLogs(logs: "Response from $apiName $response");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      print("Networking Exception occurred $apiName $e");
      // logController.saveLogs(logs: "Networking Exception occurred $apiName $e");
      return null;
    }
  }
}
