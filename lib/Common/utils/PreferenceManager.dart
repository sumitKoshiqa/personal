import 'package:get_storage/get_storage.dart';


final prefServices = PreferenceManager();
class PreferenceManager{

  final storage = GetStorage();

  saveActingAsUserId({required String? actingUserId}) async{
    storage.write('actingUserId', actingUserId);
  }

  String getActingAsUserId() {
    return storage.read('actingUserId') ?? "";
  }

  saveActingAsProfileId({required String? actingProfileId}) async{
    storage.write('actingProfileId', actingProfileId);
  }

  String getActingAsProfileId() {
    return storage.read('actingProfileId') ?? "";
  }

  saveHomeTermsAccepted({required bool homeTerms}) async{
    storage.write('homeTerms', homeTerms);
  }

  bool getHomeTermsAccepted() {
    return storage.read('homeTerms') ?? false;
  }

  saveLogin({required bool isLoggedIn}) async{
    storage.write('isLoggedIn', isLoggedIn);
  }

  Future<bool> getLogin() async{
    return storage.read('isLoggedIn') ?? false;
  }

  saveFoodAllergyPolicyAccepted({required bool value}) async{
    storage.write('isFoodAllergyPolicyAccepted', value);
  }

  bool getFoodAllergyPolicyAccepted(){
    return storage.read('isFoodAllergyPolicyAccepted') ?? false;
  }

  saveDeviceId({required String? deviceId}) async{
    storage.write('deviceId', deviceId);
  }

  String getDeviceId() {
    return storage.read('deviceId') ?? "";
  }

  saveUniqueId({required String? uniqueId}) async{
    storage.write('uniqueId', uniqueId);
  }

  String getUniqueId() {
    return storage.read('uniqueId') ?? "";
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

  saveEmail({required String? eMail}) async{
    storage.write('eMail', eMail);
  }

  String getEmail() {
    return storage.read('eMail') ?? "";
  }

  saveUserRole({required String? role}) async{
    storage.write('role', role);
  }

  String getUserRole() {
    return storage.read('role') ?? "";
  }

  saveUpdateSkipState({required String skipDt,required String stUserProfileID}) async{
    storage.write(stUserProfileID, skipDt);
  }

  // ByDefault we are saving  value of saveSkippedState is yesterday.
  String getUpdateSkipState({required String stUserProfileID}) {
    return storage.read(stUserProfileID)??DateTime.now().subtract(const Duration(hours: 26)).toIso8601String();
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