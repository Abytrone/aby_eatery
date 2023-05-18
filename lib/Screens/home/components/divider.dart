import 'package:flutter/material.dart';

import '../../../constants.dart';

class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Divider(thickness: 1, color: kDarkColor.withOpacity(0.2)),
    );
  }
}
