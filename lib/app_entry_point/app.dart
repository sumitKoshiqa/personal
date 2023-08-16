import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/app_constants.dart';
import 'package:ekikrit/Common/utils/app_theme.dart';
import 'package:ekikrit/onBoarding/controller/AuthController.dart';
import 'package:ekikrit/app_entry_point/controller/localization_controller.dart';
import 'package:ekikrit/app_entry_point/model/translations.dart';
import 'package:ekikrit/app_entry_point/routing/util/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;

  const MyApp({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();
    ScreenUtil.init(context);
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
          return GetMaterialApp(
            title: 'Ekikrit',
            debugShowCheckedModeBanner: false,
            translations: AppTranslations(languages: languages),
            fallbackLocale: Locale(AppConstants.languages[0].languageCode,
                AppConstants.languages[0].countryCode),
            locale: localizationController.locale,
            initialBinding: BindingsBuilder(() {
              Get.put<AuthController>(AuthController());
            }),
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('hi', 'IN'),
              Locale('bn', 'BD'),
            ],
            theme: ThemeData(
                primarySwatch: Colors.orange,
                fontFamily: 'SfProDisplay',
                appBarTheme: AppBarTheme(
                    backgroundColor: Constants.lightOrange,
                    elevation: 0,
                    iconTheme: IconThemeData(color: Colors.black,size: 18),

                    titleTextStyle: appTheme.textTheme.titleMedium),
                textTheme: appTheme.textTheme),
            initialRoute: '/',
            getPages: AppPages.routes,
            // home: const CreateProfileDoctor(showNavBar: false, phone: "9468506570"),
            // home: const HomeContainerDoctor(),
          );
        });
  }
}