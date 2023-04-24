import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
                          TextFormField(
                            controller: email,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '* Required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: password,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              suffixIconColor: kDarkColor,
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
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                              ),
                            ),
                            obscureText: obsecure.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '* Required';
                              }
                              return null;
                            },
                          ),
                          authServices.loading.isFalse
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 50),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextButton(
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              authServices.login(
                                                email: email.text,
                                                password: password.text,
                                              );
                                            }
                                          },
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.symmetric(
                                              horizontal: 130,
                                              vertical: 17,
                                            )),
                                            backgroundColor:
                                                MaterialStateProperty.all(
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
                                                    fontSize: 17,
                                                    color: kWhiteColor),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(50),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: InkWell(
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
