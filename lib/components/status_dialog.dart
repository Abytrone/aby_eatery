import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants.dart';

class StatusDialog extends StatelessWidget {
  const StatusDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: Get.height / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(50),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kPrimaryColor,
            ),
            child: SvgPicture.asset('assets/icons/shield_tick.svg'),
          ),
          const SizedBox(height: 15),
          const Text(
            'Congratulations!',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: Get.width / 1.8,
            child: Text(
              'Your account is ready to use. You will be redirected to the login screen in a few seconds.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kDarkColor.withOpacity(.5),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: LinearProgressIndicator(
              minHeight: 5,
            ),
          ),
        ],
      ),
    ));
  }
}
