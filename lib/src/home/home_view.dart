import 'package:flutter/material.dart';
import 'package:flutter_app_getx/src/home/home_controller.dart';
import 'package:flutter_app_getx/src/settings/settings_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final homeController homeCtrl = Get.put(homeController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'home'.tr,
        ),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              elevation: MaterialStateProperty.all(0.0),
            ),
            onPressed: () => Get.to(const SettingsView()),
            // Get.changeTheme(
            //     Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
            child: const Icon(Icons.settings),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Clicks: ${homeCtrl.count}",
              ),
            ),
            ElevatedButton(
              child: const Text('Go to other'),
              onPressed: () {
                Get.to(const Other());
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: homeCtrl.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Other extends StatelessWidget {
  const Other({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController homeCtrl = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other'),
      ),
      body: Center(
        child: Text("${homeCtrl.count}"),
      ),
    );
  }
}
