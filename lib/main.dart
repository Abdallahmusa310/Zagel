import 'package:flutter/material.dart';
import 'package:zagel/screens/home_screen.dart';
import 'package:zagel/screens/sign_up_screen.dart';
import 'package:zagel/screens/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
        routes: {
          'SplashScreen':(context)=>const SplashScreen(),
          'homescreen'  :(context)=>const HomeScreen(),
          'signup'      :(context)=>const SignUpScreen()
        },
        initialRoute: 'SplashScreen',

    );
  }
}


