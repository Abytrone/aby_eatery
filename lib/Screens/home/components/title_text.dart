import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants.dart';

class TitleText extends StatelessWidget {
  const TitleText(
      {Key? key, required this.text, this.onPressed, required this.showButton})
      : super(key: key);
  final String text;
  final bool showButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Visibility(
          visible: showButton,
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Iconsax.arrow_right_1,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
