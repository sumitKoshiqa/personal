import 'package:ekikrit/App/PrintMessage.dart';
import 'package:ekikrit/Common/Routing/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParamsMiddleware extends GetMiddleware {

  late GetPage<dynamic> routePage;

  @override
  GetPage? onPageCalled(GetPage? page) {
    PrintMessage.printMessage("params onpagecalled");
    if (page != null) {
      routePage = page;
    }

    return super.onPageCalled(page);
  }

  @override
  RouteSettings? redirect(String? route) {
    PrintMessage.printMessage("params onRedirectCalled");
    return checkParams();
  }

  RouteSettings? checkParams() {
    switch (routePage.name) {
      case "Routes.SOME_ROUTE":
        return checkProductParams(routePage);
      default:
        return null;
    }
  }

  RouteSettings? checkProductParams(GetPage<dynamic> page) {
    PrintMessage.printMessage("Product Id ParamsMiddleware${page.parameters!["productId"]}");
    if (page.parameters!.isEmpty || page.parameters!["productId"] == null) {
      return const RouteSettings(name: "Routes.SOME_ROUTE");
    }
    return null;
  }

}
