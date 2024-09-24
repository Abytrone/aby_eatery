import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/miti-qYreP9QOdrk-unsplash.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              // Positioned.fill(
              //   child: BackdropFilter(
              //     filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              //     child: Container(
              //       color: Colors.black.withOpacity(0.3),
              //     ),
              //   ),
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to',
                    style: GoogleFonts.oswald(
                      fontSize: 30,
                      color: kWhiteColor,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  // const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 50),
                    child: Divider(
                        thickness: 0.5, color: Colors.white.withOpacity(0.5)),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 10),
                  //   child: TextButton.icon(
                  //     onPressed: () {
                  //       Get.toNamed('signup');
                  //     },
                  //     style: ButtonStyle(
                  //       padding: MaterialStateProperty.all(
                  //           const EdgeInsets.symmetric(
                  //         horizontal: 70,
                  //         vertical: 15,
                  //       )),
                  //       backgroundColor: MaterialStateProperty.all(kWhiteColor),
                  //       foregroundColor: MaterialStateProperty.all(kDarkColor),
                  //       shape: MaterialStateProperty.all(
                  //         RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(40.0),
                  //         ),
                  //       ),
                  //     ),
                  //     icon: SvgPicture.asset('assets/icons/google.svg'),
                  //     label: Text(
                  //       'Continue with Google',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .bodyMedium!
                  //           .copyWith(fontSize: 17),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('signup');
                      },
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                          horizontal: 130,
                          vertical: 17,
                        )),
                        backgroundColor:
                            WidgetStateProperty.all(kPrimaryColor),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 17, color: kWhiteColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('login');
                      },
                      style: ButtonStyle(
                        padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(
                          horizontal: 75,
                          vertical: 17,
                        )),
                        backgroundColor:
                            WidgetStateProperty.all(kSecondaryColor),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                      child: Text(
                        'Already have an Account?',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 17, color: kPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
