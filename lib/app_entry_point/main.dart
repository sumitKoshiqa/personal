import 'package:ekikrit/app_entry_point/app.dart';
import 'package:ekikrit/app_entry_point/utils/app_localization.dart';
import 'package:ekikrit/app_entry_point/utils/init_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await InitializeAll().initAll();
  Map<String, Map<String, String>> _languages = await AppLocalizations().init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    languages: _languages,
  ));

}