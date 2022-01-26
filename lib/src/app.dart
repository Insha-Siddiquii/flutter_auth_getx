import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'localization/localization_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      home: const CircularProgressIndicator(),
    );
  }
}
