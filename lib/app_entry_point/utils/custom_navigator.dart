import 'package:get/get.dart';

class CustomNavigator {
  // Pushes to the route specified
  static pushTo(String strPageName, {var arguments}) async {
    return await Get.toNamed(strPageName, arguments: arguments);
  }

  static pushToParams(String strPageName, {var parameters}) async {
    return await Get.toNamed(strPageName, parameters: parameters);
  }

  // Pop the top view
  static pop({var result}) async {
    Get.back(result: result);
  }

  // Pops to a particular view
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
