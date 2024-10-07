import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/theme_controller.dart';

class SettingPage extends StatelessWidget {
  final getTheme = Get.put(ThemeController());
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(14)),
          child: Row(
            children: [
              Text('暗黑模式',
                  style: TextStyle(
                      fontSize: 16,
                      color:
                          Theme.of(context).colorScheme.onSecondaryContainer)),
              const SizedBox(width: 10),
              Switch(
                value: getTheme.isDarkMode,
                onChanged: (value) {
                  getTheme.toggleTheme();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
