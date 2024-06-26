import 'package:aby_eatery/Screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screens/auth/forgot_password.dart';
import 'Screens/auth/login.dart';
import 'Screens/auth/signup.dart';
import 'Screens/discover/discover.dart';
import 'Screens/welcome.dart';
import 'bindings/controller_bindings.dart';
import 'components/bottom_navy.dart';
import 'components/no_internet.dart';
import 'components/splash_screen.dart';
import 'components/theme.dart';
import 'components/user_bottom_navy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aby Eatery',
      initialBinding: ControllerBindings(),
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      // darkTheme: darkThemeData(context),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        'noInternet': (BuildContext context) => const NoInternetConnection(),
        'home': (BuildContext context) => const HomeScreen(),
        'welcome': (BuildContext context) => const WelcomeScreen(),
        'login': (BuildContext context) => const LoginScreen(),
        'signup': (BuildContext context) => const SignupScreen(),
        'bottomNavy': (BuildContext context) => const BottomNavy(),
        'userBottomNavy': (BuildContext context) => const UserBottomNavy(),
        'discover': (BuildContext context) => const DiscoverScreen(),
        'forgotPassword': (BuildContext context) => ForgotPasswordScreen(),
      },
    );
  }
}
