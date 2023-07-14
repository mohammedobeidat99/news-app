import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/constant/colors.dart';

import '../controller/lang_controller.dart';


class  LanguageDialog extends StatelessWidget {

      LangController controller = Get.put(LangController());

  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
      
      content: Column(
         
        mainAxisSize: MainAxisSize.min,
        children: [

         Row(children: [ const Icon(Icons.language), 
         SizedBox(width: 25,),
         
      Text('Change Language'.tr, style: const TextStyle(//color:color.maincolor
       ),),],),
          ListTile(
            title: Text('English'.tr),
            onTap: () {
              controller.ChangeLang('en');
              
              Get.back();
            },
          ),
          ListTile(
            title:  Text('Arbic'.tr),
            onTap: () {
              controller.ChangeLang('ar');
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
