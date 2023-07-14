 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget  {
   String  ?title;
   CustomAppBar({super.key , required this.title});

  @override
    Size get preferredSize => Size.fromHeight(kToolbarHeight);

  Widget build(BuildContext context) {
    return  AppBar(title: Text('$title'.tr), //backgroundColor: Color.fromRGBO(36, 54, 101, 1.0)
    );
  }
  
 
}