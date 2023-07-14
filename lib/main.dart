import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news/controller/lang_controller.dart';
import 'package:news/theme/theme_data.dart';

import 'package:news/view/control_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/news_controller.dart';
import 'controller/news_controller_science.dart';
import 'language/lang.dart';

  SharedPreferences ?sharedPref ;

void main()async {
    WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LangController controller =Get.put(LangController());
       


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: Themes.customLighttheme,
      //darkTheme: Themes.customDarktheme,//ThemeData.dark()
      
      locale:controller.start ,
      translations: Lang(),
      home: LandingPage(),
    );
  }
}

