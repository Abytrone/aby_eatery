import 'package:aby_eatery/components/primary_button.dart';
import 'package:aby_eatery/components/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/no_internet.svg',
                // height: constraints.maxWidth < 768 ? 20 : 30,
              ),
              const Text(
                'Connection error!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              PrimaryButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SplashScreen(),
                    ),
                  );
                },
                labelText: 'Try again',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
