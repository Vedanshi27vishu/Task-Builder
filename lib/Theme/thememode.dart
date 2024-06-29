import 'package:flutter/material.dart';
import 'package:taskbuilder/Theme/Appbartheme.dart';
import 'package:taskbuilder/Theme/buttonsheettheme.dart';
import 'package:taskbuilder/Theme/elevatedbutton.dart';
import 'package:taskbuilder/Theme/texttheme.dart';


class AppTheme {
  AppTheme._();
  //creating object of themedata class for light theme//
  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor:Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme:ttexttheme.lighttheme,
    elevatedButtonTheme:elevatedbuttontheme.lightelevatedbuttontheme,
    appBarTheme:tappbartheme.lightappbar,
     bottomSheetTheme: tbuttonsheet.lighttheme
  );
   static ThemeData darktheme = ThemeData(
     useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor:Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme:ttexttheme.darktheme,
    elevatedButtonTheme:elevatedbuttontheme.darkelevatedbuttontheme,
    appBarTheme:tappbartheme.darkappbar,
     bottomSheetTheme: tbuttonsheet.darktheme
   );
}
