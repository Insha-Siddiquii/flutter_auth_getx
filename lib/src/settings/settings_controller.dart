import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var themeValue = false.obs;
  get getThemeValue => themeValue.value;
  var themeMode = 'change_dark_mode'.obs;
  get getThemeMode => themeMode.value.tr;

  changeThemeMode() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
    if (Get.isDarkMode) {
      themeValue(false);
      themeMode('change_dark_mode');
    } else {
      themeValue(true);
      themeMode('change_light_mode');
    }
  }
}
