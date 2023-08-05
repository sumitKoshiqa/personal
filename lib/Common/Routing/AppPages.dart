import 'package:ekikrit/Common/Pages/Splash.dart';
import 'package:ekikrit/Common/Routing/AuthMiddleWare.dart';
import 'package:ekikrit/Common/Routing/ParamsMiddleware.dart';
import 'package:ekikrit/Consumer/Landing/Pages/ConsumerHome.dart';
import 'package:ekikrit/Consumer/Profile/Pages/YourAccount.dart';
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
        middlewares: middleWares,
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