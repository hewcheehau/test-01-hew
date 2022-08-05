
import 'package:flutter/material.dart';
import 'package:hewcheehau_test/util/navigation_service.dart';
import 'package:hewcheehau_test/util/service_locator.dart';

class SizeHelper {
  SizeHelper._();
  static double getHeight() => MediaQuery.of(sl<NavigationService>().navigatorKey.currentState!.context).size.height;
  static double getWidth() => MediaQuery.of(sl<NavigationService>().navigatorKey.currentState!.context).size.width;

  static double getHeightRemoveTop() => MediaQuery.of(sl<NavigationService>().navigatorKey.currentState!.context).size.height - kToolbarHeight - MediaQuery.of(sl<NavigationService>().navigatorKey.currentState!.context).padding.top;
  static double getTextSize() => MediaQuery.of(sl<NavigationService>().navigatorKey.currentState!.context).size.height * 0.1;
  
}