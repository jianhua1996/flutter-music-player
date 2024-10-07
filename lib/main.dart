import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/theme_controller.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final getTheme = Get.put(ThemeController());

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          home: const HomePage(),
          theme: getTheme.currentTheme.value,
        ));
  }
}
