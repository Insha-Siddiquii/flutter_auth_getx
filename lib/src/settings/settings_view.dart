import 'package:flutter/material.dart';
import 'package:flutter_app_getx/src/localization/localization_service.dart';
import 'package:get/get.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.put(SettingsController());
    String _selectedLang = LocalizationService.langs.first;
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Obx(
                () => Card(
                  child: SwitchListTile(
                    value: settingsController.getThemeValue,
                    onChanged: (value) {
                      settingsController.changeThemeMode();
                    },
                    title: Text(settingsController.getThemeMode),
                  ),
                ),
              ),
              Card(
                  child: ButtonTheme(
                alignedDropdown: true,
                child: SizedBox(
                  width: 450.0,
                  child: DropdownButton(
                    underline: const SizedBox(),
                    isExpanded: true,
                    value: _selectedLang,
                    items: LocalizationService.langs.map((String lang) {
                      return DropdownMenuItem(value: lang, child: Text(lang));
                    }).toList(),
                    hint: Text("choose_language".tr),
                    onChanged: (value) {
                      // setState(() => _selectedLang = value);
                      // gets language and changes the locale
                      LocalizationService().changeLocale(value.toString());
                    },
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
