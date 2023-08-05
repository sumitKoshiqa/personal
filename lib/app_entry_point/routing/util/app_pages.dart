import 'package:ekikrit/app_entry_point/routing/middleware/auth_middleware.dart';
import 'package:ekikrit/app_entry_point/routing/middleware/middleware.dart';
import 'package:ekikrit/app_entry_point/routing/middleware/params_middleware.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/onBoarding/pages/splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final List<GetMiddleware> middleWares = [
    AuthMiddleware(),
    RoutingMiddleware(),
    ParamsMiddleware()
  ];

  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const Splash(),
        // middlewares: middleWares,
        transition: Transition.noTransition),
    // GetPage(
    //     name: Routes.LOGIN,
    //     page: () => const LoginEntryPoint(),
    //     transition: Transition.noTransition),
    // GetPage(
    //     name: Routes.VERIFY_OTP,
    //     page: () => const VerifyOtp(),
    //     transition: Transition.noTransition),
  ];
}
