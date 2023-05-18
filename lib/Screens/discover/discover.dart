import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../components/app_bar.dart';
import '../../constants.dart';
import '../home/components/product_card.dart';
import 'components/category_card.dart';
import 'components/search_box.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        leading: IconButton(
          icon: Image.asset('assets/app_icon/foreground.png'),
          onPressed: () {},
        ),
        title: 'Discover',
        actions: <Widget>[
          IconButton(
            icon: const Icon(Iconsax.more),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SearchBox(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Popular',
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
                              'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
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
                      'Nutrition Categories',
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
                  height: 120,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: CategoryCard(
                          categoryName: 'Calories',
                          nutrition: '17 - 25 kcal',
                          categoryImage:
                              'https://plus.unsplash.com/premium_photo-1670006163348-b8eb307a80a3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Our Recommendations',
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
                              'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          title: 'Original Wasawasa Recipe',
                          productImage:
                              'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Most Searches',
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
                              'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          title: 'Original Wasawasa Recipe',
                          productImage:
                              'https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
