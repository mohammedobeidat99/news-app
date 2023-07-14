import 'package:flutter/material.dart';

class Themes{
  static ThemeData customDarktheme=ThemeData.dark().copyWith(

    appBarTheme: AppBarTheme(color: Colors.black ,),
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.red)

    ),

   
    
    
    
  );

  static ThemeData customLighttheme=ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(color:  Color.fromRGBO(36, 54, 101, 1.0)),


  );


}