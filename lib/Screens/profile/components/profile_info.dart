import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              foregroundImage:
                  AssetImage('assets/images/pexels-pixabay-415829.jpg'),
              radius: 40,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rayaan Yahaya',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '@rayaan_yahaya',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: kDarkColor.withOpacity(.5),
                      ),
                ),
              ],
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 20)),
            foregroundColor: const MaterialStatePropertyAll(kPrimaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: const BorderSide(color: kPrimaryColor, width: 2),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          child: Row(
            children: const [
              Icon(Iconsax.edit, size: 20),
              SizedBox(width: 10),
              Text('Edit'),
            ],
          ),
        ),
      ],
    );
  }
}
