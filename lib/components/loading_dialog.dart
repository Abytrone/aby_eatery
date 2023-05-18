import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(5),
        child: Center(
          child: Lottie.asset(
            'assets/animations/95944-loading-animation.json',
            repeat: true,
          ),
        ),
      ),
    );
  }
}
