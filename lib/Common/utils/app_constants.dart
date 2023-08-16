
import 'package:ekikrit/app_entry_point/model/language.dart';

class AppConstants {
  /*
  Localization data
   */
  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: "xx",
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: "xx",
        languageName: 'हिन्दी',
        countryCode: 'IN',
        languageCode: 'hi'),
  ];
}
