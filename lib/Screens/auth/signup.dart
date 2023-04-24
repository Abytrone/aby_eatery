import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'components/social_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            colorFilter: const ColorFilter.mode(
              kDarkColor,
              BlendMode.srcIn,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an Account 🔐',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: Get.mediaQuery.size.width / 1.5,
                  child: const Text(
                      'Please enter your phone number/email and password to sign up.'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Phone Number/Email',
                            hintText: 'Enter your phone number/email',
                          ),
                          cursorColor: kPrimaryColor,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number/email address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Save the form field value to a variable or database.
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter your password',
                          ),
                          obscureText: true,
                          cursorColor: kPrimaryColor,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password address';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            // Save the form field value to a variable or database.
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed('home');
                                  },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                      horizontal: 130,
                                      vertical: 17,
                                    )),
                                    backgroundColor: MaterialStateProperty.all(
                                        kPrimaryColor),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'Sign in',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontSize: 17, color: kWhiteColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 50, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 0.5,
                                width: 100,
                                color: kDarkColor.withOpacity(0.5),
                              ),
                              Text(
                                'or continue with',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: kDarkColor.withOpacity(0.5),
                                    ),
                              ),
                              Container(
                                height: 0.5,
                                width: 100,
                                color: kDarkColor.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              SocialButton(icon: 'assets/icons/google.svg'),
                              SocialButton(icon: 'assets/icons/apple.svg'),
                              SocialButton(icon: 'assets/icons/facebook.svg'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: kDarkColor.withOpacity(0.5),
                                    ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed('login');
                                },
                                child: Text(
                                  ' Sign in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: kPrimaryColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
