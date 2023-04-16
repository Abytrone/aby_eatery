import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    // _checkIfLoggedIn();
    startTime();
    super.initState();
  }

  // final AuthServices authServices = AuthServices();
  // void _checkIfLoggedIn() async {
  //   // check if token is there
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var token = localStorage.getString('token');
  //   if (token != null) {
  //     setState(() {
  //       _isLoggedIn = true;
  //     });
  //   }
  // }

  // / Setting duration in splash screen
  startTime() async {
    return Timer(const Duration(milliseconds: 5500), navigatorPage);
  }

  /// To navigate layout change
  void navigatorPage() {
    Navigator.of(context).pushReplacementNamed('welcome');
    // _isLoggedIn ? "bottomnavy" : "onboarding");
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
                'Aby Eatery',
                style: GoogleFonts.oswald(
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
