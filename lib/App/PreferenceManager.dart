import 'package:get_storage/get_storage.dart';

class PreferenceManager{

  final storage = GetStorage();

  saveLogin({required bool isLoggedIn}) async{
    storage.write('isLoggedIn', isLoggedIn);
  }

  Future<bool> getLogin() async{
    return storage.read('isLoggedIn') ?? false;
  }

  saveFirstLogin({required bool firstLogin}) async{
    storage.write('firstLogin', firstLogin);
  }

  Future<bool> getFirstLogin() async{
    return storage.read('firstLogin') ?? true;
  }

  saveDeviceId({required String? deviceId}) async{
    storage.write('deviceId', deviceId);
  }

  String getDeviceId() {
    return storage.read('deviceId') ?? "";
  }

  saveUserId({required String? userId}) async{
    storage.write('userId', userId);
  }

  String getUserId() {
    return storage.read('userId') ?? "";
  }

  saveToken({required String? token}) async{
    storage.write('token', token);
  }

  String getToken() {
    return storage.read('token') ?? "";
  }

  savePhone({required String? phone}) async{
    storage.write('phone', phone);
  }

  String getPhone() {
    return storage.read('phone') ?? "";
  }

  saveProfileId({required String? profileID}) async{
    storage.write('profileID', profileID);
  }

  String getProfileId() {
    return storage.read('profileID') ?? "";
  }

  saveProfileName({required String? profileName}) async{
    storage.write('profileName', profileName);
  }

  String getProfileName() {
    return storage.read('profileName') ?? "";
  }

  saveLogs({required String? logs}) async{
    String previousLogs = storage.read('logs') ?? "";
    String appendedLogs = "${logs!}\n.......................................\n$previousLogs";
    storage.write('logs', appendedLogs);
  }

  clearLogs() async{
    storage.write('logs', "\n.......................................");
  }

  String getLogs() {
    return storage.read('logs') ?? "";
  }
}