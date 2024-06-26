import 'package:aby_eatery/Models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: ListView.builder(
        itemCount: item.ingrediants.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kDefaultPadding),
              color: Colors.black12,
            ),
            width: 50.0,
            margin: const EdgeInsets.only(right: kDefaultPadding),
            alignment: Alignment.center,
            child: SvgPicture.asset(item.ingrediants[index]),
          );
        },
      ),
    );
  }
}
