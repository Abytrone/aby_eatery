import 'package:aby_eatery/Screens/home/product_detail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../Models/diets_model.dart';
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
    'http://localhost/v1/storage/buckets/64497203b2fc22dae964/files/644ebf264569e061bc46/view?project=6435978f59cab443127d&mode=admin',
    'http://localhost/v1/storage/buckets/64497203b2fc22dae964/files/644ebf264569e061bc46/view?project=6435978f59cab443127d&mode=admin',
    'http://localhost/v1/storage/buckets/64497203b2fc22dae964/files/644ebf264569e061bc46/view?project=6435978f59cab443127d&mode=admin',
  ];

  final ProductsController productsController = Get.find<ProductsController>();
  ValueNotifier<Future<Diets?>>? valueNotifier;
  // Future<Diets?>? _future;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(productsController.getAllProducts());
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
        title: 'Abyeatery',
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
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              colorFilter: const ColorFilter.mode(
                kDarkColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
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
                ValueListenableBuilder<Future<Diets?>>(
                    valueListenable: valueNotifier!,
                    builder: (context, value, child) {
                      return FutureBuilder<Diets?>(
                        future: value,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                height: 260,
                                child: ListView.builder(
                                  itemCount:
                                      snapshot.data!.products!.documents.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(
                                            () => ProductDetailScreen(
                                              product: snapshot.data!.products!
                                                  .documents[index],
                                              user: snapshot
                                                  .data!.user!.documents[0],
                                            ),
                                          );
                                        },
                                        child: ProductCard(
                                          username: snapshot.data!.user!
                                              .documents[0].data['name'],
                                          userImage:
                                              'http://$endPoint/storage/buckets/$profilePicturesBucket/files/${snapshot.data!.user!.documents[0].data['image']}/view?project=$projectId',
                                          title: snapshot.data!.products!
                                              .documents[index].data['name'],
                                          productImage:
                                              'http://$endPoint/storage/buckets/$productPicturesBucket/files/${snapshot.data!.products!.documents[index].data['images'][0]}/view?project=$projectId',
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return const Center(child: Text('Empty'));
                            }
                          } else {
                            return const Center(
                                child: Text('Some error occured'));
                          }
                        },
                      );
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular Recipes',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.arrow_right_1,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
                Obx(() => productsController.diets!.value.products == null
                    ? const Center(child: CircularProgressIndicator())
                    // MasonryGridView.count(
                    //     padding: const EdgeInsets.all(0),
                    //     crossAxisCount: 2,
                    //     itemCount: 5,
                    //     crossAxisSpacing: 10,
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     mainAxisSpacing: 0,
                    //     itemBuilder: (context, index) {
                    //       return const ProductShimmer();
                    //     },
                    //   )
                    : MasonryGridView.count(
                        padding: const EdgeInsets.all(0),
                        crossAxisCount: 2,
                        itemCount: productsController
                            .diets!.value.products!.documents.length,
                        crossAxisSpacing: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        mainAxisSpacing: 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(
                                () => ProductDetailScreen(
                                  product: productsController
                                      .diets!.value.products!.documents[index],
                                  user: productsController
                                      .diets!.value.user!.documents[0],
                                ),
                              );
                            },
                            child: ProductCard(
                              username: productsController
                                  .diets!.value.user!.documents[0].data['name'],
                              userImage:
                                  'http://$endPoint/storage/buckets/$profilePicturesBucket/files/${productsController.diets!.value.user!.documents[0].data['image']}/view?project=$projectId',
                              title: productsController.diets!.value.products!
                                  .documents[index].data['name'],
                              productImage:
                                  'http://$endPoint/storage/buckets/$productPicturesBucket/files/${productsController.diets!.value.products!.documents[index].data['images'][0]}/view?project=$projectId',
                            ),
                          );
                        },
                      )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
