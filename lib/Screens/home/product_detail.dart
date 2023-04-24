import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants.dart';
import 'components/comment_box.dart';
import 'components/comment_item.dart';
import 'components/detail_appbar.dart';
import 'components/ingredients_item.dart';
import 'components/instruction_item.dart';
import 'components/nutrition_item.dart';
import 'components/product_card.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Zm9vZCUyMGJhY2tncm91bmR8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1612927601601-6638404737ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGZvb2QlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGZvb2QlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
];

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    items: imgList
                        .map(
                          (item) => Stack(
                            children: <Widget>[
                              Container(
                                height: 350,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(item),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: const [0.1, 1.5],
                                      colors: [
                                        kDarkColor.withOpacity(0.7),
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                        viewportFraction: 1,
                        disableCenter: true,
                        height: 350,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  const DetailScreenAppBar(),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: _current == entry.key ? 30 : 10.0,
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: _current == entry.key
                                      ? kPrimaryColor
                                      : Colors.white,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Original Wasawasa Recipe',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                          thickness: 1, color: kDarkColor.withOpacity(0.2)),
                    ),
                    const Text(
                      'This salad is a healthy and delicious combination of fresh vegetables and fruit with a tangy balsamic dressing. Feel free to add or substitute any ingredients to suit your taste.',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                          thickness: 1, color: kDarkColor.withOpacity(0.2)),
                    ),
                    // --------------------------------------------------------
                    Text(
                      'Nutrition',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const NutritionItem(label: 'Calories', unit: '240 kcal'),
                    const NutritionItem(label: 'Carbohydrates', unit: '35 g'),
                    const NutritionItem(label: 'Protein', unit: '2 g'),
                    const NutritionItem(label: 'Fat', unit: '5 g'),
                    const NutritionItem(label: 'Cholesterol', unit: '15 mg'),
                    const NutritionItem(label: 'Fiber', unit: '23 g'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                          thickness: 1, color: kDarkColor.withOpacity(0.2)),
                    ),
                    Text(
                      'Ingredients',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const IngredientItem(
                        number: '1', text: 'One head of lettuce, chopped'),
                    const IngredientItem(
                        number: '2', text: 'One large carrot, grated'),
                    const IngredientItem(
                        number: '3', text: 'One large cucumber, sliced'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                          thickness: 1, color: kDarkColor.withOpacity(0.2)),
                    ),
                    Text(
                      'Instructions',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const InstructionItem(
                      number: '1',
                      text:
                          'in a large salad bowl, combine the chopped lettuce, grated carrot, sliced cucumber, chopped apple, cherry tomatoes and raisins.',
                      images: [
                        'assets/images/welcome_screen.jpg',
                        'assets/images/welcome_screen.jpg',
                        'assets/images/welcome_screen.jpg',
                      ],
                    ),
                    const SizedBox(height: 10),
                    const InstructionItem(
                      number: '2',
                      text:
                          'in a large salad bowl, combine the chopped lettuce, grated carrot, sliced cucumber, chopped apple, cherry tomatoes and raisins.',
                      images: [
                        'assets/images/welcome_screen.jpg',
                        'assets/images/welcome_screen.jpg',
                        'assets/images/welcome_screen.jpg',
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                          thickness: 1, color: kDarkColor.withOpacity(0.2)),
                    ),
                    // --------------------------------------------------------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Comments',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
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
                    ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const CommentItem();
                      },
                    ),
                    const CommentBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                          thickness: 1, color: kDarkColor.withOpacity(0.2)),
                    ),
                    // --------------------------------------------------------
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More Recipes Like This',
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
              ),
              SizedBox(
                height: 260,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: ProductCard(
                        username: 'Rayaan Yahaya',
                        userImage:
                            'assets/images/pexels-koolshooters-6976943.jpg',
                        title: 'Original Wasawasa Recipe',
                        productImage: 'assets/images/welcome_screen.jpg',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Container(
          //   height: 100,
          //   padding: const EdgeInsets.all(10),
          //   decoration: const BoxDecoration(
          //     color: kWhiteColor,
          //   ),
          //   child: Row(
          //     children: [
          //       const CircleAvatar(
          //         foregroundImage:
          //             AssetImage('assets/images/pexels-pixabay-415829.jpg'),
          //         radius: 20,
          //       ),
          //       const SizedBox(width: 20),
          //       Expanded(
          //         child: Container(
          //           padding: const EdgeInsets.only(left: 20),
          //           decoration: BoxDecoration(
          //             color: const Color(0xFFEAEAEA),
          //             borderRadius: BorderRadius.circular(25),
          //           ),
          //           child: TextFormField(
          //             decoration: InputDecoration(
          //               label: const Text('Add a comment'),
          //               border: InputBorder.none,
          //               suffixIcon: IconButton(
          //                 onPressed: () {},
          //                 icon: SvgPicture.asset(
          //                   'assets/icons/send.svg',
          //                   colorFilter: const ColorFilter.mode(
          //                     kPrimaryColor,
          //                     BlendMode.srcIn,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
