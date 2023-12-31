import 'package:dio/dio.dart' as dioLib;
import 'package:ekikrit/Common/utils/PreferenceManager.dart';

class GetDio {

  dioLib.Dio getDio() {

    String token = PreferenceManager().getToken();
    String profileId = PreferenceManager().getProfileId();
    String deviceId = PreferenceManager().getDeviceId();
    String appId = PreferenceManager().getUniqueId();
    String actingUserId = PreferenceManager().getActingAsUserId();
    String actingProfileId = PreferenceManager().getActingAsProfileId();

    print("My token $token and profile id $profileId and deviceId is $deviceId and appId $appId");

    dioLib.Dio dio = dioLib.Dio();

    // dio.options.headers['X-USER-ID'] = "1";
    dio.options.headers["X-ACCESS-TOKEN"] = token;
    dio.options.headers["profileId"] = profileId;
    dio.options.headers["X-PROFILE-ID"] = profileId;
    dio.options.headers["deviceId"] = deviceId;
    dio.options.headers["appId"] = appId;
    dio.options.headers["zoneId"] = "IST";
    dio.options.headers["X-ACTING-USER-ID"] = actingUserId;
    dio.options.headers["X-ACTING-PROFILE-ID"] = actingProfileId;
    dio.options.headers["content-type"] = "application/json";

    return dio;
  }
}
