import 'package:ekikrit/Consumer/Landing/Pages/ConsumerHome.dart';
import 'package:ekikrit/Consumer/Profile/Pages/CreateMinor.dart';
import 'package:ekikrit/Consumer/Profile/Pages/CreateProxy.dart';
import 'package:ekikrit/Consumer/Profile/Pages/MinorsPage.dart';
import 'package:ekikrit/Consumer/Profile/Pages/ProxyPage.dart';
import 'package:ekikrit/Consumer/Profile/Pages/YourAccount.dart';
import 'package:ekikrit/app_entry_point/routing/middleware/auth_middleware.dart';
import 'package:ekikrit/app_entry_point/routing/middleware/params_middleware.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/onBoarding/pages/login_page.dart';
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
        name: Routes.SPLASH,
        page: () => const Splash(),
        // middlewares: middleWares,
        transition: Transition.noTransition),

    // login
    GetPage(
        name: Routes.LOGIN,
        page: () =>  LoginPage(),
        transition: Transition.noTransition),


    // consumer home
    GetPage(
        name: Routes.CONSUMER_HOME,
        page: () => const ConsumerHome(),
        middlewares: middleWares,
        transition: Transition.noTransition),

    // consumer account
    GetPage(
        name: Routes.CONSUMER_ACCOUNT,
        page: () => const YourAccount(),
        middlewares: middleWares,
        transition: Transition.noTransition),

    // consumer proxy
    GetPage(
        name: Routes.CONSUMER_PROXY,
        page: () => const ProxyPage(),
        middlewares: middleWares,
        transition: Transition.noTransition),

    // consumer create proxy
    GetPage(
        name: Routes.CONSUMER_CREATE_PROXY,
        page: () => const CreateProxy(),
        middlewares: middleWares,
        transition: Transition.noTransition),

    // consumer minors
    GetPage(
        name: Routes.CONSUMER_MINORS,
        page: () => const MinorsPage(),
        middlewares: middleWares,
        transition: Transition.noTransition),

    // consumer create minors
    GetPage(
        name: Routes.CONSUMER_CREATE_MINORS,
        page: () => const CreateMinor(),
        middlewares: middleWares,
        transition: Transition.noTransition),



  ];

}