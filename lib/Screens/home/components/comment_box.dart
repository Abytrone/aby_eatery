import 'package:aby_eatery/controllers/comments_controller.dart';
import 'package:aby_eatery/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../services/constants.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({Key? key, required this.dietId}) : super(key: key);
  final String dietId;

  @override
  Widget build(BuildContext context) {
    final TextEditingController comment = TextEditingController();
    final CommentController commentController = Get.find();
    final UserController userController = Get.find();
    return Row(
      children: [
        SizedBox(
          height: 45,
          width: 45,
          child: Obx(
            () => ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: userController.user.value.value!.prefs.data['profile'] ==
                      null
                  ? Image.asset(
                      'assets/images/placeholder_landscape.png',
                      fit: BoxFit.cover,
                    )
                  : FadeInImage.assetNetwork(
                      placeholder: 'assets/images/placeholder_landscape.png',
                      image:
                          'https://$endPoint/storage/buckets/$profilePicturesBucket/files/${userController.user.value.value!.prefs.data['profile']}/view?project=$projectId&mode=admin',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.black12.withOpacity(0.03),
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextFormField(
              controller: comment,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                // label: const Text('Add a comment'),

                hintText: 'Add a comment',
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {
                    if (comment.text != '') {
                      commentController.addComment(
                        comment: comment.text,
                        dietId: dietId,
                      );
                    }
                  },
                  iconSize: 30,
                  icon: SvgPicture.asset(
                    'assets/icons/send.svg',
                    colorFilter: const ColorFilter.mode(
                      kPrimaryColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
