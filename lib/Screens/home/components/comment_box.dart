import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          foregroundImage:
              AssetImage('assets/images/pexels-pixabay-415829.jpg'),
          radius: 25,
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
