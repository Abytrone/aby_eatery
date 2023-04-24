import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class InstructionImage extends StatelessWidget {
  const InstructionImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: kDarkLightColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/image.svg',
              width: 30,
              colorFilter: const ColorFilter.mode(
                kDarkLightColor,
                BlendMode.srcIn,
              ),
            ),
            const Text(
              'Add image',
              style: TextStyle(color: kDarkLightColor, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
