import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:news/view/settings_screen.dart';
import 'package:news/view/weather_screen/weather_screen.dart';

import '../controller/landingpage_controller.dart';
import '../controller/theme_controller.dart';
import 'news_screen/health_screen.dart';
import 'news_screen/science_screen.dart';
import 'news_screen/sports_screen.dart';

class LandingPage extends StatelessWidget {
  ThemeController controller = Get.put(ThemeController());
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: controller.isDarkMode.value
                ? Colors.amber
                : Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.sports,
                    size: 20.0,
                  ),
                ),
                label: 'Sports'.tr,
                backgroundColor: controller.isDarkMode.value
                    ? Colors.amber
                    : Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.science_outlined,
                    size: 20.0,
                  ),
                ),
                label: 'Science'.tr,
                backgroundColor: controller.isDarkMode.value
                    ? Colors.amber
                    : Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.health_and_safety_outlined,
                    size: 20.0,
                  ),
                ),
                label: 'Health'.tr,
                backgroundColor: controller.isDarkMode.value
                    ? Colors.amber
                    : Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.sunny_snowing,
                    size: 20.0,
                  ),
                ),
                label: 'Weather'.tr,
                backgroundColor: controller.isDarkMode.value
                    ? Colors.amber
                    : Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'Settings'.tr,
                backgroundColor: controller.isDarkMode.value
                    ? Colors.amber
                    : Color.fromRGBO(36, 54, 101, 1.0),
                //  backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              Sports(),
              Science(),
              Health(),
              Weather(),
              Settings(),
            ],
          )),
    ));
  }
}
