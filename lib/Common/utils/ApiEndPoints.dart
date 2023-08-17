
class ApiEndPoints {
  // STAGE
  static const String baseUrl = "http://3.142.229.170:30008/";
  static const String baseUrl2 = "http://3.142.229.170:30008/";

  static const String logoutURL = "${baseUrl}authentication/user/logout";
  static const String sendOTP = "${baseUrl}authentication/user/otp/initiate";
  static const String reSendOTP = "${baseUrl}authentication/user/otp/resend";
  static const String sendOTPMobile = "${baseUrl}authentication/user/mobile/otp/initiate";
  static const String reSendOTPMobile = "${baseUrl}authentication/user/mobile/otp/resend";
  static const String verifyOTP = "${baseUrl}authentication/user/otp/verify";

  static const String verifyGoogleLogin = "${baseUrl}authentication/user/google/verify";

  // profile
  static const String getProfiles = "${baseUrl}profile/user/basic-profile";
  static const String createProfile = "${baseUrl}profile/user/basic-profile";


}
