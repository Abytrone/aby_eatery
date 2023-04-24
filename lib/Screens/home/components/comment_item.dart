import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      foregroundImage:
                          AssetImage('assets/images/pexels-pixabay-415829.jpg'),
                      radius: 25,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Rayaan Yahaya',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.more),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Loving this recipe! So many delicious recipes to choose from ♥♥♥',
              ),
            ),
            Row(
              children: [
                const Icon(
                  Iconsax.heart,
                ),
                const SizedBox(width: 10),
                Text(
                  '356',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kDarkColor.withOpacity(0.7),
                      ),
                ),
                const SizedBox(width: 30),
                Text(
                  '1 week ago',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kDarkColor.withOpacity(0.7),
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
