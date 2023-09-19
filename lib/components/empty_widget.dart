import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset('assets/icons/empty-pad.svg'),
          const Text(
            'Empty',
            style: TextStyle(color: kDarkColor),
          ),
        ],
      ),
    );
  }
}
