import 'package:aby_eatery/Screens/home/product_detail.dart';
import 'package:aby_eatery/components/empty_widget.dart';
import 'package:aby_eatery/services/local_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/app_bar.dart';
import '../../constants.dart';
import '../../controllers/products_controller.dart';
import '../../services/constants.dart';
import 'components/ad_card.dart';
import 'components/product_card.dart';
import 'components/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    'https://$endPoint/storage/buckets/$productPicturesBucket/files/64bd357b3edd3e051892/view?project=$projectId',
    'https://plus.unsplash.com/premium_photo-1673108852141-e8c3c22a4a22?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
    'https://plus.unsplash.com/premium_photo-1673108852141-e8c3c22a4a22?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
  ];

  final ProductsController productsController = Get.find();
  final AbyServices abyServices = AbyServices();

  @override
  void initState() {
    productsController.getAllProducts();
    productsController.getRecentProducts();
    productsController.getAuthUserProducts();
    productsController.getAuthUserDraftProducts();
    productsController.getAuthUserPublishedProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        leading: Transform.translate(
          offset: const Offset(kDefaultPadding * 0.5, 0),
          child: IconButton(
            icon: Image.asset('assets/app_icon/foreground.png'),
            onPressed: () {},
          ),
        ),
        title: 'FB Nutrition',
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/notification.svg',
              colorFilter: const ColorFilter.mode(
                kDarkColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: SvgPicture.asset(
          //     'assets/icons/heart.svg',
          //     colorFilter: const ColorFilter.mode(
          //       kDarkColor,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          productsController.getAllProducts();
          return productsController.getRecentProducts();
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            // Top Banner
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    items: imageList
                        .map(
                          (image) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: AdsWidget(
                              image: image,
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      disableCenter: true,
                      height: 180,
                    ),
                  ),
                  const TitleText(text: 'Recent Recipes', showButton: true),
                  Obx(() => productsController.loadingRecents.isTrue
                      ? Center(child: abyServices.loading())
                      : productsController.recentDiets.value.value == null
                          ? const Center(child: EmptyWidget())
                          : SizedBox(
                              height: 260,
                              child: ListView.builder(
                                itemCount: productsController.recentDiets.value
                                    .value!.products!.documents.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final user = productsController
                                      .recentDiets.value.value!.user;
                                  final product = productsController
                                      .recentDiets.value.value!.products;
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => ProductDetailScreen(
                                            product: product.documents[index],
                                          ),
                                        );
                                      },
                                      child: ProductCard(
                                        username:
                                            user!.documents[0].data['name'],
                                        userImage:
                                            'https://$endPoint/storage/buckets/$profilePicturesBucket/files/${user.documents[0].data['image']}/view?project=$projectId',
                                        title: product!
                                            .documents[index].data['name'],
                                        productImage:
                                            'https://$endPoint/storage/buckets/$productPicturesBucket/files/${product.documents[index].data['images'][0]}/view?project=$projectId',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
                  const TitleText(text: 'Popular Recipes', showButton: true),
                  Obx(() => productsController.loadingDiets.isTrue
                      ? Center(child: abyServices.loading())
                      : productsController.diets.value.value == null
                          ? const Center(child: EmptyWidget())
                          : MasonryGridView.count(
                              padding: const EdgeInsets.all(0),
                              crossAxisCount: 2,
                              itemCount: productsController.diets.value.value!
                                  .products!.documents.length,
                              crossAxisSpacing: 10,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              mainAxisSpacing: 0,
                              itemBuilder: (context, index) {
                                final user =
                                    productsController.diets.value.value!.user;
                                final products = productsController
                                    .diets.value.value!.products;
                                return InkWell(
                                  onTap: () {
                                    Get.to(
                                      () => ProductDetailScreen(
                                        product: products.documents[index],
                                      ),
                                    );
                                  },
                                  child: ProductCard(
                                    username: user!.documents[0].data['name'],
                                    userImage:
                                        'https://$endPoint/storage/buckets/$profilePicturesBucket/files/${user.documents[0].data['image']}/view?project=$projectId',
                                    title:
                                        products!.documents[index].data['name'],
                                    productImage:
                                        'https://$endPoint/storage/buckets/$productPicturesBucket/files/${products.documents[index].data['images'][0]}/view?project=$projectId',
                                  ),
                                );
                              },
                            )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
