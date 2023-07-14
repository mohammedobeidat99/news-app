import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../main.dart';

class LangController extends GetxController {
  Locale start = sharedPref!.getString('lang') == null
      ? Get.deviceLocale!
      : Locale(sharedPref!.getString('lang')!);

  void ChangeLang(String languageCode) {
    Locale locale = Locale(languageCode);
    sharedPref!.setString('lang', languageCode);

    Get.updateLocale(locale);
  }

  

}
