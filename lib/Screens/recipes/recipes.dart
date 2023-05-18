import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants.dart';
import 'components/recipe_product_card.dart';

class MyRecipes extends StatefulWidget {
  const MyRecipes({Key? key}) : super(key: key);

  @override
  State<MyRecipes> createState() => _MyRecipesState();
}

class _MyRecipesState extends State<MyRecipes> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Recipes',
          style: GoogleFonts.quicksand(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Image.asset('assets/app_icon/foreground.png'),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.more),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.symmetric(vertical: 10),
              unselectedLabelColor: kDarkColor.withOpacity(0.5),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: kPrimaryColor),
              ),
              unselectedLabelStyle: const TextStyle(fontFamily: 'Okine'),
              tabs: const [
                Text(
                  'Draft (10)',
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  'Publish (15)',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 5),
                    child: MasonryGridView.count(
                      padding: const EdgeInsets.all(0),
                      crossAxisCount: 2,
                      itemCount: 5,
                      crossAxisSpacing: 10,
                      shrinkWrap: true,
                      mainAxisSpacing: 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Get.to(() => const ProductDetailScreen());
                          },
                          child: const RecipeProductCard(
                            title: 'Original Wasawasa Recipe',
                            productImage:
                                'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          ),
                        );
                      },
                    ),
                  ),
                  // ------------------------TAB------------------------------
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: MasonryGridView.count(
                      padding: const EdgeInsets.all(0),
                      crossAxisCount: 2,
                      itemCount: 5,
                      crossAxisSpacing: 10,
                      shrinkWrap: true,
                      mainAxisSpacing: 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Get.to(() => const ProductDetailScreen());
                          },
                          child: const RecipeProductCard(
                            title: 'Original Wasawasa Recipe',
                            productImage:
                                'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
