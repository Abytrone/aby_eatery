import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.03),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          label: const Text(
            'Search for Recipe or Chef',
            style: TextStyle(
              color: kDarkLightColor,
              fontSize: 17,
            ),
          ),
          border: InputBorder.none,
          prefixIcon: IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              colorFilter: const ColorFilter.mode(
                kDarkLightColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
