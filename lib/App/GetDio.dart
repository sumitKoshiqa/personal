import 'package:dio/dio.dart' as dioLib;
import 'PreferenceManager.dart';
import 'PrintMessage.dart';

class GetDio{

  dioLib.Dio getDio(){

    String token = PreferenceManager().getToken();
    String userId = PreferenceManager().getUserId();
    String deviceId = PreferenceManager().getDeviceId();
    PrintMessage.printMessage("My token $token and userId $userId");

    dioLib.Dio dio = dioLib.Dio();

    dio.options.headers["userid"] = userId;
    dio.options.headers["token"] = token;



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

  // Future<dynamic> get({url, queryParams, apiName}) async{
  //   try {
  //     var dio = getDio();
  //     dioLib.Response response = await dio.get(
  //       url,
  //       queryParameters: queryParams
  //     );
  //     PrintMessage.printMessage("Response from $apiName $response");
  //     if (response.statusCode == 200) {
  //       return response.data;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     PrintMessage.printMessage("Networking Exception occurred $apiName $e");
  //     return null;
  //   }
  // }
  //
  //
  // Future<dynamic> post({url, queryParams, postParams, apiName}) async{
  //   try {
  //     var dio = getDio();
  //     dioLib.Response response = await dio.post(
  //         url,
  //         queryParameters: queryParams,
  //         data: postParams
  //     );
  //     PrintMessage.printMessage("Response from $apiName $response");
  //     logController.saveLogs(logs: "Response from $apiName $response");
  //     if (response.statusCode == 200) {
  //       return response.data;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     PrintMessage.printMessage("Networking Exception occurred $apiName $e");
  //     logController.saveLogs(logs: "Networking Exception occurred $apiName $e");
  //     return null;
  //   }
  // }
}