import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
      margin: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavItem(
            tap: () {},
            icon: 'assets/icons/home.svg',
          ),
          NavItem(
            tap: () {},
            icon: 'assets/icons/discover.svg',
          ),
          Material(
            elevation: 7.0,
            shadowColor: kPrimaryColor, // Change the shadow color here
            borderRadius: BorderRadius.circular(30.0),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: kPrimaryColor,
              shape: const CircleBorder(),
              elevation: 0,
              child: const Icon(Icons.add),
            ),
          ),
          NavItem(
            tap: () {},
            icon: 'assets/icons/recipes.svg',
          ),
          NavItem(
            tap: () {},
            icon: 'assets/icons/profile.svg',
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({Key? key, required this.tap, required this.icon})
      : super(key: key);

  final GestureTapCallback tap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: SvgPicture.asset(icon),
    );
  }
}
