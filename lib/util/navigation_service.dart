

import 'package:flutter/material.dart';

class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, Map? arg) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arg);
  }

  goBack() => navigatorKey.currentState!.pop();

}