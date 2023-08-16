import 'dart:convert';

import 'package:ekikrit/Common/utils/app_constants.dart';
import 'package:ekikrit/app_entry_point/controller/localization_controller.dart';
import 'package:ekikrit/app_entry_point/model/language.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppLocalizations {
  Future<Map<String, Map<String, String>>> init() async {
    Get.lazyPut(() => LocalizationController());

    // Retrieving localized data
    Map<String, Map<String, String>> _languages = Map();


    for (LanguageModel languageModel in AppConstants.languages) {
      String jsonStringValues = await rootBundle
          .loadString('assets/i18n/${languageModel.languageCode}.json');
      Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
      Map<String, String> _json = Map();

      _mappedJson.forEach((key, value) {
        _json[key] = value.toString();
      });
      _languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
          _json;
    }

    return _languages;
  }
}