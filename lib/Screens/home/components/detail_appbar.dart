import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants.dart';

class DetailScreenAppBar extends StatelessWidget {
  const DetailScreenAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Iconsax.arrow_left,
              color: kWhiteColor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Iconsax.bookmark,
                  color: kWhiteColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Iconsax.share,
                  color: kWhiteColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Iconsax.more,
                  color: kWhiteColor,
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
