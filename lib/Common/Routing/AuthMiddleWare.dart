import 'package:ekikrit/App/PreferenceManager.dart';
import 'package:ekikrit/App/PrintMessage.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {

  @override
  GetPage? onPageCalled(GetPage? page) {
    // routingController.changeRoute(page!.name);
    if(page?.parameters!['accessToken'] != null) {

    }
    checkIfAuthenticated(page?.name ?? "");

    return super.onPageCalled(page);
  }

  checkIfAuthenticated(String url) async {
    bool isLogin = await PreferenceManager().getLogin();
    var token = PreferenceManager().getToken();
    PrintMessage.printMessage("checking if authenticated...");
    if (!isLogin && token.isEmpty) {
      // CustomNavigator.pushReplace(Routes.LOGIN);
    } else {}
  }
}
