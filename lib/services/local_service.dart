import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constants.dart';

class AbySnackBar {
  static void successSnackbar({required String text}) {
    Get.snackbar(
      'Success Message',
      text,
      colorText: Colors.white,
      maxWidth: 350,
      backgroundColor: kPrimaryColor,
      borderRadius: 5,
      margin: const EdgeInsets.only(bottom: 30),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void errorSnackbar({required String text}) {
    Get.snackbar(
      'Error Message',
      text,
      colorText: Colors.white,
      maxWidth: 350,
      backgroundColor: kErrorColor,
      borderRadius: 5,
      margin: const EdgeInsets.only(bottom: 30),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void warningSnackbar({required String text}) {
    Get.snackbar(
      'Warning Message',
      text,
      colorText: Colors.white,
      maxWidth: 350,
      backgroundColor: kWarninngColor,
      borderRadius: 5,
      margin: const EdgeInsets.only(bottom: 30),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

class AbyServices {
  Widget loading() {
    return Lottie.asset(
      'assets/animations/95944-loading-animation.json',
      repeat: true,
    );
  }
}
