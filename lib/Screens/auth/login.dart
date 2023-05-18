import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../components/input_field.dart';
import '../../components/primary_button.dart';
import '../../constants.dart';
import '../../services/auth_services.dart';
import 'components/social_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthServices authServices = AuthServices();
  final obsecure = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: SvgPicture.asset(
      //       'assets/icons/back.svg',
      //       colorFilter: const ColorFilter.mode(
      //         kDarkColor,
      //         BlendMode.srcIn,
      //       ),
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello there 👋',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: Get.mediaQuery.size.width / 1.5,
                    child: const Text(
                        'Please enter your username/email and password to sign in.'),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AuthInputField(
                            controller: email,
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            validator: (email) {
                              String pattern =
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                  r"{0,253}[a-zA-Z0-9])?)*$";
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(email!)) {
                                return 'Enter a valid email address';
                              } else if (email.isEmpty) {
                                return "* Required";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          AuthInputField(
                            controller: password,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            obscureText: obsecure.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '* Required';
                              }
                              return null;
                            },
                            suffixIcon: obsecure.value
                                ? IconButton(
                                    onPressed: () {
                                      obsecure(false);
                                    },
                                    icon: const Icon(Iconsax.eye_slash),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      obsecure(true);
                                    },
                                    icon: const Icon(Iconsax.eye),
                                  ),
                          ),
                          authServices.loading.isFalse
                              ? PrimaryButton(
                                  labelText: 'Sign in',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      authServices.login(
                                        email: email.text,
                                        password: password.text,
                                      );
                                    }
                                  },
                                )
                              : Lottie.asset(
                                  'assets/animations/95944-loading-animation.json',
                                  repeat: true,
                                ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed('forgotPassword');
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 17,
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              )
                            ],
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
                                  'Don\'t have an account?',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: kDarkColor.withOpacity(0.5),
                                      ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed('signup');
                                  },
                                  child: Text(
                                    ' Sign up',
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
      ),
    );
  }
}
