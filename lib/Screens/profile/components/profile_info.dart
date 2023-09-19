import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants.dart';
import '../../../controllers/user_controller.dart';
import '../../../services/constants.dart';

final UserController userController = Get.find();

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
            SizedBox(
              height: 80,
              width: 80,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  // ignore: invalid_use_of_protected_member
                  child: userController.user.value['image'] == null
                      ? FadeInImage.assetNetwork(
                          placeholder:
                              'assets/images/placeholder_landscape.png',
                          image:
                              // ignore: invalid_use_of_protected_member
                              'https://$endPoint/storage/buckets/$profilePicturesBucket/files/${userController.user.value['image']}/view?project=$projectId',
                          fit: BoxFit.cover,
                          placeholderFit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/placeholder_landscape.png',
                          fit: BoxFit.cover,
                        )),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // ignore: invalid_use_of_protected_member
                  userController.user.value['name'],
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        // ignore: invalid_use_of_protected_member
                        userController.user.value['email'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kDarkColor.withOpacity(.5),
                        ),
                      ),
                    ),
                    Visibility(
                      // ignore: invalid_use_of_protected_member
                      visible: userController.user.value['emailVerification'] ==
                          false,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: kErrorColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Text(
                            'unverified',
                            style: TextStyle(color: kErrorColor),
                          ),
                        ),
                      ),
                    ),
                  ],
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
          child: const Row(
            children: [
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
