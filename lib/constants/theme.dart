
import 'package:flutter/material.dart';
import 'package:hewcheehau_test/constants/app_color.dart';

class ThemeApp {
  ThemeApp._();
  factory ThemeApp.init() => ThemeApp._();

  ThemeData get themData => _themeData();

  ThemeData _themeData() => ThemeData(
    primaryColor: AppColors.mainColor,
  
  );
}