
class ApiEndPoints {
  // STAGE
  // static const String baseUrl = "http://3.142.229.170:30003/";
  static const String baseUrl = "http://3.142.229.170:30001/gateway/";
  static const String logoutURL = "${baseUrl}authentication/user/logout";
  static const String sendOTP = "${baseUrl}authentication/user/otp/initiate";
  static const String reSendOTP = "${baseUrl}authentication/user/otp/resend";
  static const String verifyOTP = "${baseUrl}authentication/user/otp/verify";

  static const String verifyGoogleLogin = "${baseUrl}authentication/user/google/verify";

  // profile
  static const String getProfiles = "${baseUrl}profile/user/basic-profile";
  static const String createProfile = "${baseUrl}profile/user/basic-profile";


}
