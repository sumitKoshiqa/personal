import 'package:ekikrit/app_entry_point/routing/controller/routing_controller.dart';
import 'package:get/get.dart';

class RoutingMiddleware extends GetMiddleware {

  RoutingController routingController = Get.put(RoutingController());

  @override
  GetPage? onPageCalled(GetPage? page) {
    print("Middleware: page name ${page?.name}");
    routingController.changeRoute(page!.name);
    return super.onPageCalled(page);
  }
}