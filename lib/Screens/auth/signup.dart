import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

import '../../components/input_field.dart';
import '../../components/primary_button.dart';
import '../../constants.dart';
import '../../services/auth_services.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthServices authServices = AuthServices();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController name = TextEditingController();

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

  bool obsecure = true;

  bool confirmObsecure = true;

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
                        AuthInputField(
                          controller: name,
                          textCapitalization: TextCapitalization.words,
                          labelText: 'Full Name',
                          hintText: 'Enter your full name',
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "* Required";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        AuthInputField(
                          controller: email,
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
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
                          obscureText: obsecure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '* Required';
                            } else if (value.length < 8) {
                              return '* Password must be 8 characters and above';
                            }
                            return null;
                          },
                          suffixIcon: obsecure
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obsecure = false;
                                    });
                                  },
                                  icon: const Icon(Iconsax.eye_slash),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obsecure = true;
                                    });
                                  },
                                  icon: const Icon(Iconsax.eye),
                                ),
                        ),
                        const SizedBox(height: 20),
                        AuthInputField(
                          controller: confirmPassword,
                          labelText: 'Confirm Password',
                          hintText: 'Enter your confirm password',
                          obscureText: confirmObsecure,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '* Required';
                            } else if (password.text != value) {
                              return '* Password do not match';
                            }
                            return null;
                          },
                          suffixIcon: confirmObsecure
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      confirmObsecure = false;
                                    });
                                  },
                                  icon: const Icon(Iconsax.eye_slash),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      confirmObsecure = true;
                                    });
                                  },
                                  icon: const Icon(Iconsax.eye),
                                ),
                        ),
                        authServices.loading.isFalse
                            ? PrimaryButton(
                                labelText: 'Sign up',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    authServices.signup(
                                      name: name.text,
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
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 30, horizontal: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Container(
                        //         height: 0.5,
                        //         width: 100,
                        //         color: kDarkColor.withOpacity(0.5),
                        //       ),
                        //       Text(
                        //         'or continue with',
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .bodyMedium!
                        //             .copyWith(
                        //               color: kDarkColor.withOpacity(0.5),
                        //             ),
                        //       ),
                        //       Container(
                        //         height: 0.5,
                        //         width: 100,
                        //         color: kDarkColor.withOpacity(0.5),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // const Padding(
                        //   padding:
                        //       EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       SocialButton(icon: 'assets/icons/google.svg'),
                        //       SocialButton(icon: 'assets/icons/apple.svg'),
                        //       SocialButton(icon: 'assets/icons/facebook.svg'),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
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
