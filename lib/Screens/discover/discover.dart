import 'package:aby_eatery/components/empty_widget.dart';
import 'package:aby_eatery/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../components/app_bar.dart';
import '../../services/constants.dart';
import '../home/components/product_card.dart';
import '../home/product_detail.dart';
import 'components/search_box.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final ProductsController productsController = Get.find();
  @override
  void initState() {
    productsController.hasSearched(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        leading: IconButton(
          icon: Image.asset('assets/app_icon/foreground.png'),
          onPressed: () {},
        ),
        title: 'Search',
        actions: <Widget>[
          IconButton(
            icon: const Icon(Iconsax.more),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => ListView(
            shrinkWrap: true,
            children: [
              const SearchBox(),
              const SizedBox(height: 10),
              productsController.searchDiets.value.value == null &&
                      productsController.hasSearched.isFalse
                  ? const Center(
                      child: Text('Enter something to search!'),
                    )
                  : const SizedBox.shrink(),
              productsController.searchDiets.value.value == null &&
                      productsController.hasSearched.isTrue
                  ? const Center(
                      child: EmptyWidget(),
                    )
                  : const SizedBox.shrink(),
              productsController.searchDiets.value.value == null
                  ? const SizedBox.shrink()
                  : MasonryGridView.count(
                      padding: const EdgeInsets.all(0),
                      crossAxisCount: 2,
                      itemCount: productsController
                          .searchDiets.value.value!.products!.documents.length,
                      crossAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      mainAxisSpacing: 0,
                      itemBuilder: (context, index) {
                        final searchedProducts =
                            productsController.searchDiets.value.value;
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => ProductDetailScreen(
                                product:
                                    searchedProducts.products!.documents[index],
                              ),
                            );
                          },
                          child: ProductCard(
                            username: searchedProducts!
                                .user!.documents[0].data['name'],
                            userImage:
                                'https://$endPoint/storage/buckets/$profilePicturesBucket/files/${searchedProducts.user!.documents[0].data['image']}/view?project=$projectId',
                            title: searchedProducts
                                .products!.documents[index].data['name'],
                            productImage:
                                'https://$endPoint/storage/buckets/$productPicturesBucket/files/${searchedProducts.products!.documents[index].data['images'][0]}/view?project=$projectId',
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
