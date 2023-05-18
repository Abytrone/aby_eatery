import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/input_field.dart';
import '../../components/primary_button.dart';
import '../../constants.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
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
                  'Forgot Password 🔑',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: Get.mediaQuery.size.width / 1.5,
                  child: const Text(
                      'Please enter your phone number/email, an OTP code will be sent for verification in the next step.'),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AuthInputField(
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
                        PrimaryButton(
                          onPressed: () {},
                          labelText: 'Continue',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Remember your password?',
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
