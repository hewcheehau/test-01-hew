import 'package:flutter/material.dart';
import 'package:hewcheehau_test/constants/app_color.dart';
import 'package:hewcheehau_test/constants/string_constants.dart';
import 'package:hewcheehau_test/screen/home_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1),
        () => Navigator.of(context).pushReplacementNamed(HomeScreen.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(StringConstants.appName, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,),),
          const SizedBox(height: 20,),
          Lottie.asset("assets/images/animation/97930-loading.json", repeat: true)
        ],
      ),
    ),
    );
  }
}
