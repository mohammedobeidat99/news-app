import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_data.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  final String _themePreferenceKey = 'themePreference';
  @override
  void onInit() {
    super.onInit();
    loadThemePreference();
  }

  void toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(
        isDarkMode.value ? Themes.customDarktheme : Themes.customLighttheme);
    if (isDarkMode.value == false) {
      Get.snackbar(
        'Theme',
        ' Light Theme Mode ',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Theme',
        ' Dark Theme Mode ',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.amber,
        colorText: Colors.black,
      );
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themePreferenceKey, isDarkMode.value);
  }

  void loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDarkModeSaved = prefs.getBool(_themePreferenceKey);
    if (isDarkModeSaved != null) {
      isDarkMode.value = isDarkModeSaved;
      Get.changeTheme(
          isDarkMode.value ? Themes.customDarktheme : Themes.customLighttheme);
    }
  }
}
