import 'package:aby_eatery/Screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/auth/login.dart';
import 'Screens/welcome.dart';
import 'components/splash_screen.dart';
import 'components/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aby Eatery',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      // darkTheme: darkThemeData(context),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => const HomeScreen(),
        'welcome': (BuildContext context) => const WelcomeScreen(),
        'login': (BuildContext context) => const LoginScreen(),
      },
    );
  }
}
