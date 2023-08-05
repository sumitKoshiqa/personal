import 'package:get/get.dart';

class CustomNavigator {

  static pushTo(String strPageName, {var arguments}) async {
    return await Get.toNamed(strPageName, arguments: arguments);
  }

  static pop({var result}) async {
    Get.back(result: result);
  }

  static popTo(String strPageName) {
    Get.offNamedUntil(strPageName, (route) => false);
  }

  static pushOff(String strPageName, {var arguments}) {
    Get.offNamed(strPageName, arguments: arguments);
  }

  static pushReplace(String strPageName, {var arguments}) {
    Get.offAllNamed(strPageName, arguments: arguments);
  }
}