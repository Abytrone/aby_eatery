import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({Key? key, required this.icon}) : super(key: key);
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: kDarkColor.withOpacity(0.1)),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
