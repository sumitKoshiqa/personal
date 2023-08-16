import 'package:ekikrit/Common/utils/app_localization.dart';
import 'package:ekikrit/app_entry_point/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Map<String, Map<String, String>> _languages = await AppLocalizations().init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  setPathUrlStrategy();
  runApp(MyApp(
    languages: _languages,
  ));
}

