import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../components/app_bar.dart';
import '../../constants.dart';
import '../../services/auth_services.dart';
import 'components/ad_card.dart';
import 'components/product_card.dart';
import 'product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    'assets/images/Green Natural Healthy Food Menu Banner.png',
    'assets/images/Green Natural Healthy Food Menu Banner.png',
    'assets/images/Green Natural Healthy Food Menu Banner.png',
  ];
  final AuthServices authServices = AuthServices();
  final GetStorage box = GetStorage();
  String? sessionId;
  @override
  void initState() {
    sessionId = box.read('sessionId');
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
            onPressed: () {
              authServices.logout(sessionId: sessionId!);
            },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Recipes',
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
                SizedBox(
                  height: 260,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ProductCard(
                          username: 'Rayaan Yahaya',
                          userImage:
                              'assets/images/pexels-koolshooters-6976943.jpg',
                          title: 'Original Wasawasa Recipe',
                          productImage:
                              'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                        ),
                      );
                    },
                  ),
                ),
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
                MasonryGridView.count(
                  padding: const EdgeInsets.all(0),
                  crossAxisCount: 2,
                  itemCount: 5,
                  crossAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(() => const ProductDetailScreen());
                      },
                      child: const ProductCard(
                        username: 'Rayaan Yahaya',
                        userImage: 'assets/images/pexels-pixabay-415829.jpg',
                        title: 'Original Wasawasa Recipe',
                        productImage:
                            'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
