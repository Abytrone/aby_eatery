import 'package:flutter/material.dart';

import '../../../constants.dart';

class SocialInfo extends StatelessWidget {
  const SocialInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const Text(
              '24',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'recipes',
              style: TextStyle(
                color: kDarkColor.withOpacity(.5),
              ),
            )
          ],
        ),
        Container(height: 50, width: 1, color: kDarkColor.withOpacity(0.2)),
        Column(
          children: [
            const Text(
              '234',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'following',
              style: TextStyle(
                color: kDarkColor.withOpacity(.5),
              ),
            )
          ],
        ),
        Container(height: 50, width: 1, color: kDarkColor.withOpacity(0.2)),
        Column(
          children: [
            const Text(
              '2,434',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              'followers',
              style: TextStyle(
                color: kDarkColor.withOpacity(.5),
              ),
            )
          ],
        ),
      ],
    );
  }
}
