import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskbuilder/Screens/onboarding.dart';
import 'package:taskbuilder/Theme/thememode.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lighttheme,
      darkTheme: AppTheme.darktheme,
      home: OnBoardingScreen(),
    );
  }
}
