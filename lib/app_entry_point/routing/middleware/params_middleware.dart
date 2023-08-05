import 'package:ekikrit/app_entry_point/routing/controller/routing_controller.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParamsMiddleware extends GetMiddleware {
  RoutingController routingController = Get.put(RoutingController());
  late GetPage<dynamic> routePage;

  GetPage? onPageCalled(GetPage? page) {
    print("params onpagecalled");
    if (page != null) {
      routePage = page;
    }

    return super.onPageCalled(page);
  }

  RouteSettings? checkParams() {
    switch (routePage.name) {
      case Routes.CONSUMER_DISEASE:
        return checkDiseaseParams(routePage);

      default:
        return null;
    }
  }

  RouteSettings? checkDiseaseParams(GetPage<dynamic> page) {
    print("params==>${page.parameters!["selSpecialityId"]}");
    if (page.parameters!.isEmpty ||
        page.parameters!["selSpecialityId"] == null) {
      return const RouteSettings(name: Routes.CONSUMER_SPECIALITY);
    }
    return null;
  }

  @override
  RouteSettings? redirect(String? route) {
    print("params onRedirectCalled");
    return checkParams();
  }
}
