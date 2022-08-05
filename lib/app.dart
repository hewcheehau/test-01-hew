import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hewcheehau_test/constants/theme.dart';
import 'package:hewcheehau_test/cubits/add_cost_cubit.dart';
import 'package:hewcheehau_test/cubits/fetch_job_cubit.dart';
import 'package:hewcheehau_test/screen/earn_detail_screen.dart';
import 'package:hewcheehau_test/screen/home_screen.dart';
import 'package:hewcheehau_test/splash_screen.dart';
import 'package:hewcheehau_test/util/navigation_service.dart';
import 'package:hewcheehau_test/util/service_locator.dart';

class DailyCalculatorApp extends StatelessWidget {
  const DailyCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<FetchJobCubit>(create: (_) => FetchJobCubit()),
      BlocProvider<AddCostCubit>(create: (_) => AddCostCubit())
    ], child: const DailyCalculatorAppView());
  }
}

class DailyCalculatorAppView extends StatelessWidget {
  const DailyCalculatorAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: sl<NavigationService>().navigatorKey,
      theme: sl<ThemeApp>().themData,
      routes: {HomeScreen.routeName: (context) => const HomeScreen(),
      EarnDetailScreen.routeName: (context) => const EarnDetailScreen()
      },
      home: const SplashScreen(),
    );
  }
}
