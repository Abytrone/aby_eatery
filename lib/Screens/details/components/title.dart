import 'package:aby_eatery/Models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: const TextStyle(fontSize: 24),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/star.svg',
                  width: kDefaultPadding * 0.8,
                ),
                const SizedBox(width: kDefaultPadding * 0.5),
                Text(
                    '${item.rating.toString()} (${item.ratingCount.toString()})')
              ],
            )
          ],
        ),
        IconButton(
            icon: SvgPicture.asset('assets/icons/heart.svg'), onPressed: () {})
      ],
    );
  }
}
