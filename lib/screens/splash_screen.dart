import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zagel/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Expanded(
            child: Center(
                child: Lottie.asset('assets/Animation - 1732800938738.json')),
          )
        ],
      ),
      nextScreen: const HomeScreen(),
      splashIconSize: 500,
      duration: 2,
      centered: true,
      curve: Curves.easeInQuad,
    );
  }
}
