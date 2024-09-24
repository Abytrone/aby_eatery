import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/user_controller.dart';
import '../services/auth_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoggedIn = false;
  final UserController userController = Get.find();
  @override
  void initState() {
    userController.getUser();
    _checkIfLoggedIn();
    startTime();
    super.initState();
  }

  final AuthServices authServices = AuthServices();
  void _checkIfLoggedIn() async {
    // check if token is there
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('sessionId');
    if (token != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }

    // final userType = await userController.getUser();
    // if (userType == null) {
    //   setState(() {
    //     user = userType;
    //   });
    // }
  }

  // / Setting duration in splash screen
  startTime() async {
    return Timer(const Duration(milliseconds: 5500), navigatorPage);
  }

  /// To navigate layout change
  void navigatorPage() {
    Navigator.of(context).pushReplacementNamed(
      _isLoggedIn
          ? userController.user.value.value == null
              ? 'noInternet'
              : userController.user.value.value!.prefs.data['role'] == 'admin'
                  ? 'bottomNavy'
                  : 'userBottomNavy'
          : 'welcome',
    );
  }

  @override
  void didChangeDependencies() {
    precacheImage(Image.asset('assets/app_icon/icon.png').image, context);
    super.didChangeDependencies();
  }

  /// Code Create UI Splash Screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: constraints.maxWidth < 768 ? 150 : 250,
                width: constraints.maxWidth < 768 ? 150 : 250,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/app_icon/icon.png'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'FB Nutrition',
                style: GoogleFonts.quicksand(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
