import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:codesprint/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Image.asset('images/logo.jpg'),
          splashIconSize: double.infinity,
          nextScreen: Onbording(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.black,
          duration: 3000,
        ));
  }
}
