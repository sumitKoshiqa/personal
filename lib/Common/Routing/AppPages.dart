import 'package:ekikrit/Common/Pages/Splash.dart';
import 'package:ekikrit/Common/Routing/AuthMiddleWare.dart';
import 'package:ekikrit/Common/Routing/ParamsMiddleware.dart';
import 'package:ekikrit/Consumer/Profile/Pages/ConsumerHome.dart';
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



  ];

}