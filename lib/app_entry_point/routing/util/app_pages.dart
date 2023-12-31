import 'package:ekikrit/Consumer/Landing/Pages/ConsumerHome.dart';
import 'package:ekikrit/Consumer/Landing/Pages/HomeContainerConsumer.dart';
import 'package:ekikrit/Consumer/Profile/Pages/MinorSearchResult.dart';
import 'package:ekikrit/Consumer/Profile/Pages/SearchMinor.dart';
import 'package:ekikrit/Consumer/Profile/Pages/CreateProxy.dart';
import 'package:ekikrit/Consumer/Profile/Pages/CustomerService.dart';
import 'package:ekikrit/Consumer/Profile/Pages/LegalPolicyPage.dart';
import 'package:ekikrit/Consumer/Profile/Pages/MinorsPage.dart';
import 'package:ekikrit/Consumer/Profile/Pages/NotificationSettings.dart';
import 'package:ekikrit/Consumer/Profile/Pages/ProxyPage.dart';
import 'package:ekikrit/Consumer/Profile/Pages/YourAccount.dart';
import 'package:ekikrit/Consumer/Shopping/Pages/Checkout.dart';
import 'package:ekikrit/Consumer/Shopping/Pages/Orders.dart';
import 'package:ekikrit/app_entry_point/routing/middleware/auth_middleware.dart';
import 'package:ekikrit/app_entry_point/routing/middleware/params_middleware.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_routes.dart';
import 'package:ekikrit/onBoarding/pages/link_identity.dart';
import 'package:ekikrit/onBoarding/pages/login_page.dart';
import 'package:ekikrit/onBoarding/pages/registration_page.dart';
import 'package:ekikrit/onBoarding/pages/splash.dart';
import 'package:ekikrit/onBoarding/pages/verify_otp.dart';
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
        page: () =>  const LoginPage(),
        transition: Transition.noTransition),
    // login
    GetPage(
        name: Routes.VERIFY_OTP,
        page: () =>  const VerifyOTP(),
        transition: Transition.noTransition),

    // reg
    GetPage(
        name: Routes.REGISTRATION,
        page: () =>  const Registration(),
        transition: Transition.noTransition),
    // reg
    GetPage(
        name: Routes.LINK_ACCOUNT,
        page: () =>  const LinkIdentity(),
        transition: Transition.noTransition),


    // consumer home
    GetPage(
        name: Routes.CONSUMER_HOME,
        page: () => const HomeContainerConsumer(),
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
        name: Routes.CONSUMER_SEARCH_MINORS,
        page: () => const SearchMinor(),
        middlewares: middleWares,
        transition: Transition.noTransition),


    // consumer notification settings
    GetPage(
        name: Routes.CONSUMER_NOTIFICATION_SETTINGS,
        page: () => const NotificationSettings(),
        middlewares: middleWares,
        transition: Transition.noTransition),

    // consumer customer service
    GetPage(
        name: Routes.CONSUMER_CUSTOMER_SERVICE,
        page: () => const CustomerService(),
        middlewares: middleWares,
        transition: Transition.noTransition),

    // consumer customer policy page
    GetPage(
        name: Routes.CONSUMER_POLICY_PAGE,
        page: () => const LegalPolicyPage(),
        middlewares: middleWares,
        transition: Transition.noTransition),


    // consumer orders
    GetPage(
        name: Routes.CONSUMER_ORDERS,
        page: () => const Orders(),
        middlewares: middleWares,
        transition: Transition.noTransition),

    // consumer minor search result
    GetPage(
        name: Routes.CONSUMER_MINOR_SEARCH_RESULTS,
        page: () => MinorSearchResult(
          minorSearchResponseModel: Get.arguments["minorModel"],
        ),
        middlewares: middleWares,
        transition: Transition.noTransition),

    // consumer checkout
    GetPage(
        name: Routes.CONSUMER_CHECKOUT,
        page: () => Checkout(
          cartId: Get.parameters["cartId"],
        ),
        middlewares: middleWares,
        transition: Transition.noTransition),



  ];

}