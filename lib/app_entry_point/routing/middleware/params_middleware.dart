import 'package:ekikrit/app_entry_point/routing/controller/routing_controller.dart';
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

}
