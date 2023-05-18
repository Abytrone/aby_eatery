import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  'http://localhost/v1/storage/buckets/64497203b2fc22dae964/files/644e6868b76f9b1fd527/view?project=6435978f59cab443127d&mode=admin',
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
              decoration: InputDecoration(
                label: const Text('Add a comment'),
                border: InputBorder.none,
                suffixIcon: IconButton(
                  onPressed: () {},
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
