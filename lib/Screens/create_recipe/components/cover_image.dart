import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kDarkLightColor.withOpacity(0.5),
        border: Border.all(color: kDarkLightColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/image.svg',
            width: 90,
            colorFilter: const ColorFilter.mode(
              kDarkLightColor,
              BlendMode.srcIn,
            ),
          ),
          const Text(
            'Add cover image',
            style: TextStyle(color: kDarkLightColor, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
