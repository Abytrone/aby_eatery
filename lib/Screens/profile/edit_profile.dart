import 'package:aby_eatery/Screens/create_recipe/components/input_field.dart';
import 'package:aby_eatery/components/primary_button.dart';
import 'package:aby_eatery/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants.dart';
import '../../services/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Center(
              child: Stack(
                children: [
                  Obx(
                    () => SizedBox(
                      width: 170,
                      height: 170,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: userController.image.value.value != null
                            ? Image.file(
                                userController.image.value.value!,
                                fit: BoxFit.cover,
                              )
                            : userController.user.value.value == null
                                ? Image.asset(
                                    'assets/images/placeholder_landscape.png',
                                    fit: BoxFit.cover,
                                  )
                                : userController.user.value.value!.prefs
                                            .data['profile'] ==
                                        null
                                    ? Image.asset(
                                        'assets/images/placeholder_landscape.png',
                                        fit: BoxFit.cover,
                                      )
                                    : FadeInImage.assetNetwork(
                                        placeholder:
                                            'assets/images/placeholder_landscape.png',
                                        image:
                                            'https://$endPoint/storage/buckets/$profilePicturesBucket/files/${userController.user.value.value!.prefs.data['profile']}/view?project=$projectId&mode=admin',
                                        fit: BoxFit.cover,
                                      ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        userController.pickProfilePicture();
                      },
                      icon: const Icon(Iconsax.edit),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.white),
                        foregroundColor: WidgetStatePropertyAll(kPrimaryColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const AbyInputField(
              label: 'Full Name',
              hintText: 'Full Name',
              controller: null,
            ),
            // const AbyInputField(
            //   label: 'Last Name',
            //   hintText: 'Last Name',
            //   controller: null,
            // ),
            // const AbyInputField(
            //   label: 'Date of Birth',
            //   hintText: 'Date of Birth',
            //   controller: null,
            // ),
            const AbyInputField(
              label: 'Email',
              hintText: 'Enter email',
              controller: null,
            ),
            const AbyInputField(
              label: 'Phone Number',
              hintText: 'Enter phone number',
              controller: null,
            ),
            const AbyInputField(
              label: 'Address',
              hintText: 'Enter address',
              controller: null,
            ),
            const AbyInputField(
              label: 'Description',
              hintText: 'Enter description',
              maxLines: 5,
              controller: null,
            ),
            PrimaryButton(
              onPressed: () {},
              labelText: 'Submit',
            ),
          ],
        ),
      ),
    );
  }
}
