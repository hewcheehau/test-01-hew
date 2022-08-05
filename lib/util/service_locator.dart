

import 'package:get_it/get_it.dart';
import 'package:hewcheehau_test/constants/theme.dart';
import 'package:hewcheehau_test/util/navigation_service.dart';

final sl = GetIt.instance;

Future<void> startup() async {
  sl.registerSingleton<ThemeApp>(ThemeApp.init());
  sl.registerSingleton<NavigationService>(NavigationService());
  
}