import 'package:aby_eatery/controllers/comments_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({Key? key, required this.dietId}) : super(key: key);
  final String dietId;

  @override
  Widget build(BuildContext context) {
    final TextEditingController comment = TextEditingController();
    final CommentController commentController = Get.find();
    return Row(
      children: [
        SizedBox(
          height: 45,
          width: 45,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder_landscape.png',
              image:
                  'https://cloud.appwrite.io/v1/storage/buckets/644ef4f24ccfdc5336f8/files/64bd357b3edd3e051892/view?project=646a7e8ad278150d5bd7&mode=admin',
              // ignore: invalid_use_of_protected_member
              // 'http://$endPoint/storage/buckets/$profilePicturesBucket/files/${userController.user.value['image']}/view?project=$projectId',
              fit: BoxFit.cover,
              placeholderFit: BoxFit.cover,
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
