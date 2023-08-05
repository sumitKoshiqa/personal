import 'package:ekikrit/onBoarding/controller/AuthController.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/app_entry_point/utils/PreferenceManager.dart';
import 'package:ekikrit/app_entry_point/utils/ShowMessages.dart';
import 'package:ekikrit/app_entry_point/utils/custom_navigator.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {

  @override
  GetPage? onPageCalled(GetPage? page) {
    checkIfAuthenticated(page?.name ?? "");

    return super.onPageCalled(page);
  }

  checkIfAuthenticated(String url) async {
    bool isLogin = await PreferenceManager().getLogin();
    var token = PreferenceManager().getToken();
    print("checking if authenticated...$isLogin>>>$token");
    if (!isLogin && token.isEmpty) {
      CustomNavigator.pushReplace(Routes.SPLASH);
    } else {
      print(
          "userRole===> ${PreferenceManager().getUserRole()}");
      print("urlFirst===> ${url.split("/")[1]}");
      if ((PreferenceManager().getUserRole() == "PATIENT" &&
              url.split("/")[1] == "healthExpert") ||
          (PreferenceManager().getUserRole() == "HEALTH_EXPERT" &&
              url.split("/")[1] == "consumer")) {
        ShowMessages().showSnackBarRed(
            "REDIRECTING_TITLE".trParams({"x": "INVALID_USER_ROLE".tr}),
            "REDIRECT_DESCRIPTION".tr);
        // Get.put(AuthController()).logOut();
        CustomNavigator.pushReplace(Routes.SPLASH);
      }
    }
  }
}
