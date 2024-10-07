import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // color: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.music_note_sharp,
                size: 42,
              ),
              SizedBox(height: 10),
              Text('简约播放器', style: TextStyle(fontSize: 22))
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
            ),
            child: ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  '首页',
                ),
                onTap: () {
                  Get.back();
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
            ),
            child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  '设置',
                ),
                onTap: () {
                  Get.back();
                  Get.to(() => SettingPage());
                }),
          ),
        ],
      ),
    );
  }
}
