import 'package:ekikrit/Consumer/Landing/Pages/ConsumerHome.dart';
import 'package:ekikrit/Consumer/Profile/Pages/YourAccount.dart';
import 'package:ekikrit/app_entry_point/routing/middleware/auth_middleware.dart';
import 'package:ekikrit/app_entry_point/routing/middleware/params_middleware.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/onBoarding/pages/splash.dart';
import 'package:get/get.dart';



class AppPages{
  AppPages._();

  static final List<GetMiddleware> middleWares = [
    AuthMiddleware(),
    ParamsMiddleware(),
  ];

  static final routes = [

    // splash
    GetPage(
        name: "/",
        page: () => const Splash(),
        // middlewares: middleWares,
        transition: Transition.noTransition),


    // consumer home
    GetPage(
        name: "/home",
        page: () => const ConsumerHome(),
        middlewares: middleWares,
        transition: Transition.noTransition),

    // consumer account
    GetPage(
        name: "/account",
        page: () => const YourAccount(),
        middlewares: middleWares,
        transition: Transition.noTransition),



  ];

}