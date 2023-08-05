import 'package:ekikrit/App/AppTheme.dart';
import 'package:ekikrit/Common/Routing/AppPages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppTheme appTheme = AppTheme();
    return GetMaterialApp(
      title: 'Ekikrit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: appTheme.textTheme
      ),
      routingCallback: (routing){},
      // navigatorKey: Get.key,
      initialRoute: "/",
      navigatorObservers: <NavigatorObserver>[
        GetObserver(),
      ],
      getPages: AppPages.routes,
      // home: const Splash(),
    );
  }
}

