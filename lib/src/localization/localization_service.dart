import 'package:flutter/material.dart';
import 'package:flutter_app_getx/src/lang/en_us.dart';
import 'package:flutter_app_getx/src/lang/ur_pk.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  // Default locale
  static Locale locale = const Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static Locale fallbackLocale = const Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
    'اردو',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
    const Locale('ur', 'PK'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ur_PK': urPK,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }
}
