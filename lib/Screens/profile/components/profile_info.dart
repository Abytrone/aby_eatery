import 'package:aby_eatery/Screens/profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants.dart';
import '../../../controllers/user_controller.dart';
import '../../../services/constants.dart';

final UserController userController = Get.find();

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Row(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child:
                      userController.user.value.value!.prefs.data['profile'] !=
                              null
                          ? FadeInImage.assetNetwork(
                              placeholder:
                                  'assets/images/placeholder_landscape.png',
                              image:
                                  'https://$endPoint/storage/buckets/$profilePicturesBucket/files/${userController.user.value.value!.prefs.data['profile']}/view?project=$projectId&mode=admin',
                              fit: BoxFit.cover,
                              placeholderFit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/placeholder_landscape.png',
                              fit: BoxFit.cover,
                            ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userController.user.value.value!.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        userController.user.value.value!.email,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kDarkColor.withOpacity(.5),
                        ),
                      ),
                      // Visibility(
                      //   visible:
                      //       userController.user.value.value!.emailVerification ==
                      //           false,
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(
                      //         horizontal: 10, vertical: 2),
                      //     decoration: BoxDecoration(
                      //       color: kErrorColor.withOpacity(0.1),
                      //       borderRadius: BorderRadius.circular(5),
                      //     ),
                      //     child: const Center(
                      //       child: Text(
                      //         'unverified',
                      //         style: TextStyle(color: kErrorColor),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            Get.to(() => const EditProfileScreen());
          },
          style: ButtonStyle(
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 20)),
            foregroundColor: const WidgetStatePropertyAll(kPrimaryColor),
            shape: WidgetStateProperty.all(
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
