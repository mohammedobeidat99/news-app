import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/lang_controller.dart';
import 'package:news/controller/theme_controller.dart';

import '../widget/appbar.dart';
import '../widget/dealog.dart';

class Settings extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Change Language
            ListTile(
              title: Text(
                'Change Language'.tr,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.language),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => LanguageDialog(),
                  );
                },
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => LanguageDialog(),
                );
              },
            ),
            Divider(
              height: 3,
              color: Colors.grey,
            ),

            // Dark Theme
            ListTile(
              title: Text(
                'Dark Theme'.tr,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: Obx(
                () => Switch(
                  activeColor: Colors.amber,
                  value: themeController.isDarkMode.value,
                  onChanged: (value) {
                    themeController.toggleTheme();
                  },
                ),
              ),
            ),
            Divider(
              height: 3,
              color: Colors.grey,
            ),

            // About
            ListTile(
              title: Text(
                'About'.tr,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.info_outline),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('About'.tr),
                    content: Text(
                        'This is a news application developed using Flutter and GetX, It is developed by the programmer Mohammed Obeidat'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Close'.tr),
                      ),
                    ],
                  ),
                );
              },
            ),
            Divider(
              height: 3,
              color: Colors.grey,
            ),

            // Contact Us
            ListTile(
              title: Text(
                'Contact Us'.tr,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.mail_outline),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Contact Us'.tr),
                    content: Text(
                        'For any inquiries, please email us at obeidatmohammed80@gmail.com.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Close'.tr),
                      ),
                    ],
                  ),
                );
              },
            ),
            Divider(
              height: 3,
              color: Colors.grey,
            ),

            // More Settings Options Here
            // ...

            // Example of a Setting with Description
            ListTile(
              title: Text(
                'Some Option'.tr,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                'This is a description of the Some Option setting.'.tr,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              trailing: Icon(Icons.settings),
              onTap: () {
                // Do something when this option is tapped
              },
            ),
            Divider(
              height: 3,
              color: Colors.grey,
            ),

           
          ],
        ),
      ),
    );
  }
}
