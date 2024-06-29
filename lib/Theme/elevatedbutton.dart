import "package:flutter/material.dart";

class elevatedbuttontheme {
  elevatedbuttontheme._();
  // Light theme

  static ElevatedButtonThemeData lightelevatedbuttontheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
              backgroundColor:  Color.fromARGB(255, 139, 96, 147),
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
              side: const BorderSide(color:  Color.fromARGB(255, 139, 96, 147)),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle:
                  const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));

  //Dark Theme
  static ElevatedButtonThemeData darkelevatedbuttontheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
              backgroundColor:  Color.fromARGB(255, 139, 96, 147),
              foregroundColor: Colors.white,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
              side: const BorderSide(color: Color.fromARGB(255, 139, 96, 147)),
              padding: const EdgeInsets.symmetric(vertical: 18),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));
}
