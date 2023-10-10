import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Screens/discover/discover.dart';
import '../Screens/home/home.dart';
import '../Screens/profile/profile.dart';
import '../constants.dart';

class UserBottomNavy extends StatefulWidget {
  const UserBottomNavy({Key? key, this.page}) : super(key: key);
  final int? page;

  @override
  State<UserBottomNavy> createState() => _UserBottomNavyState();
}

class _UserBottomNavyState extends State<UserBottomNavy> {
  int _currentIndex = 0;
  PageController? _pageController;
  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.page == null ? 0 : widget.page!);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            HomeScreen(),
            DiscoverScreen(),
            // MyRecipes(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          return BottomNavigationBar(
            currentIndex: widget.page ?? _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);
              _pageController!.jumpToPage(index);
            },
            selectedItemColor: kPrimaryColor,
            selectedLabelStyle: TextStyle(
              fontSize: constraints.maxWidth < 768 ? 12 : 20,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: constraints.maxWidth < 768 ? 12 : 20,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    colorFilter: const ColorFilter.mode(
                      kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/home_filled.svg',
                    colorFilter: ColorFilter.mode(
                      (_currentIndex == 0 || widget.page == 0)
                          ? kPrimaryColor
                          : kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/discover.svg',
                    colorFilter: const ColorFilter.mode(
                      kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/discover_filled.svg',
                    colorFilter: ColorFilter.mode(
                      (_currentIndex == 1 || widget.page == 1)
                          ? kPrimaryColor
                          : kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                label: 'Discover',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    colorFilter: const ColorFilter.mode(
                      kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SvgPicture.asset(
                    'assets/icons/profile_filled.svg',
                    colorFilter: ColorFilter.mode(
                      (_currentIndex == 2 || widget.page == 2)
                          ? kPrimaryColor
                          : kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
