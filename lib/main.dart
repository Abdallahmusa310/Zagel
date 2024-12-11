import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zagel/firebase_options.dart';
import 'package:zagel/screens/home_screen.dart';
import 'package:zagel/screens/sign_up_screen.dart';
import 'package:zagel/screens/splash_screen.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
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
          'homescreen'  :(context)=> HomeScreen(),
          'signup'      :(context)=>const SignUpScreen()
        },
        initialRoute: 'SplashScreen',

    );
  }
}


