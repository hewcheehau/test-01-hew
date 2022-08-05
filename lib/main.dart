import 'package:flutter/material.dart';
import 'package:hewcheehau_test/util/service_locator.dart';
import 'app.dart';

Future<void> main() async {
  await startup();
  runApp(const DailyCalculatorApp());
}


