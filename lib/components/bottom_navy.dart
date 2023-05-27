import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Screens/create_recipe/create_recipe.dart';
import '../Screens/discover/discover.dart';
import '../Screens/home/home.dart';
import '../Screens/profile/profile.dart';
import '../Screens/recipes/recipes.dart';
import '../constants.dart';
import '../controllers/products_controller.dart';
import '../controllers/user_controller.dart';

class BottomNavy extends StatefulWidget {
  const BottomNavy({Key? key, this.page}) : super(key: key);
  final int? page;

  @override
  State<BottomNavy> createState() => _BottomNavyState();
}

class _BottomNavyState extends State<BottomNavy> {
  int _currentIndex = 0;
  PageController? _pageController;
  final UserController userController = Get.put(UserController());
  final ProductsController productsController = Get.put(ProductsController());

  @override
  void initState() {
    super.initState();
    userController.getUser();
    productsController.getAuthUserProducts();
    productsController.getAllProducts();
    productsController.getRecentProducts();
    _pageController = PageController();
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
            MyRecipes(),
            ProfileScreen(),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Get.to(() => const CreateRecipeScreen());
        },
        padding: const EdgeInsets.all(15),
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(kPrimaryColor),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
        ),
        icon: const Icon(Icons.add),
        color: Colors.white,
      ),
      // Material(
      //   elevation: 7.0,
      //   shadowColor: kPrimaryColor, // Change the shadow color here
      //   borderRadius: BorderRadius.circular(30.0),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Get.to(() => const CreateRecipeScreen());
      //     },
      //     backgroundColor: kPrimaryColor,
      //     shape: const CircleBorder(),
      //     elevation: 0,
      //     child: const Icon(Icons.add),
      //   ),
      // ),
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
                      _currentIndex == 0 ? kPrimaryColor : kDarkColor,
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
                      _currentIndex == 1 ? kPrimaryColor : kDarkColor,
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
                    'assets/icons/recipes.svg',
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
                    'assets/icons/recipes_filled.svg',
                    colorFilter: ColorFilter.mode(
                      _currentIndex == 2 ? kPrimaryColor : kDarkColor,
                      BlendMode.srcIn,
                    ),
                    height: constraints.maxWidth < 768 ? 20 : 30,
                  ),
                ),
                label: 'My Recipes',
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
                      _currentIndex == 3 ? kPrimaryColor : kDarkColor,
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
