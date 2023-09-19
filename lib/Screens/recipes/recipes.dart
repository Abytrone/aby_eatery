import 'package:aby_eatery/components/empty_widget.dart';
import 'package:aby_eatery/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants.dart';
import '../../services/constants.dart';
import '../home/product_detail.dart';
import 'components/recipe_product_card.dart';

class MyRecipes extends StatefulWidget {
  const MyRecipes({Key? key}) : super(key: key);

  @override
  State<MyRecipes> createState() => _MyRecipesState();
}

class _MyRecipesState extends State<MyRecipes> with TickerProviderStateMixin {
  late TabController _tabController;
  final ProductsController productsController = Get.find();
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
    final draftProducts = productsController.userDraftProducts.value.value;
    final publishedProducts =
        productsController.userPublishedProducts.value.value;
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
              tabs: [
                Text(
                  draftProducts != null
                      ? 'Draft (${draftProducts.total})'
                      : 'Draft',
                  style: const TextStyle(fontSize: 17),
                ),
                Text(
                  publishedProducts != null
                      ? 'Publish (${publishedProducts.total})'
                      : 'Published',
                  style: const TextStyle(fontSize: 17),
                ),
              ],
            ),
            Flexible(
              child: TabBarView(
                controller: _tabController,
                children: [
                  draftProducts == null
                      ? const Center(
                          child: EmptyWidget(),
                        )
                      : draftProducts.documents.isEmpty
                          ? const Center(
                              child: EmptyWidget(),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 10, right: 5),
                              child: MasonryGridView.count(
                                padding: const EdgeInsets.all(0),
                                crossAxisCount: 2,
                                itemCount: draftProducts.documents.length,
                                crossAxisSpacing: 10,
                                shrinkWrap: true,
                                mainAxisSpacing: 0,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => ProductDetailScreen(
                                            product:
                                                draftProducts.documents[index],
                                          ));
                                    },
                                    child: RecipeProductCard(
                                      id: draftProducts.documents[index].$id,
                                      title: draftProducts
                                          .documents[index].data['name'],
                                      productImage:
                                          'https://$endPoint/storage/buckets/$productPicturesBucket/files/${draftProducts.documents[index].data['images'][0]}/view?project=$projectId',
                                    ),
                                  );
                                },
                              ),
                            ),
                  // ------------------------TAB------------------------------
                  publishedProducts == null
                      ? const Center(
                          child: EmptyWidget(),
                        )
                      : publishedProducts.documents.isEmpty
                          ? const Center(
                              child: EmptyWidget(),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: MasonryGridView.count(
                                padding: const EdgeInsets.all(0),
                                crossAxisCount: 2,
                                itemCount: publishedProducts.documents.length,
                                crossAxisSpacing: 10,
                                shrinkWrap: true,
                                mainAxisSpacing: 0,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(() => ProductDetailScreen(
                                            product: publishedProducts
                                                .documents[index],
                                          ));
                                    },
                                    child: RecipeProductCard(
                                      id: publishedProducts
                                          .documents[index].$id,
                                      title: publishedProducts
                                          .documents[index].data['name'],
                                      productImage:
                                          'https://$endPoint/storage/buckets/$productPicturesBucket/files/${publishedProducts.documents[index].data['images'][0]}/view?project=$projectId',
                                      // 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
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
