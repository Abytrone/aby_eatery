import 'package:appwrite/models.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../services/constants.dart';
import 'components/comment_box.dart';
import 'components/comment_item.dart';
import 'components/detail_appbar.dart';
import 'components/divider.dart';
import 'components/ingredients_item.dart';
import 'components/instruction_item.dart';
import 'components/nutrition_item.dart';
import 'components/product_card.dart';
import 'components/title_text.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.product,
    required this.user,
  }) : super(key: key);
  final Document product;
  final Document? user;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [];

  @override
  void initState() {
    // if (imgList == []) {
    for (var i = 0; i < widget.product.data['images'].length; i++) {
      imgList.add(widget.product.data['images'][i]);
    }
    // }
    super.initState();
  }

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
                              FadeInImage.assetNetwork(
                                height: 350,
                                width: MediaQuery.of(context).size.width,
                                placeholder:
                                    'assets/images/placeholder_landscape.png',
                                image:
                                    'http://$endPoint/storage/buckets/$productPicturesBucket/files/$item/view?project=$projectId',
                                fit: BoxFit.cover,
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
                child: Text(
                  widget.product.data['name'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const HorizontalDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.product.data['description'],
                ),
              ),
              const HorizontalDivider(),

              // --------------------------------------------------------
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TitleText(text: 'Nutrition', showButton: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: widget.product.data['nutrition'].length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final nutrition = widget
                            .product.data['nutrition'][index]
                            .replaceAll('[', '')
                            .replaceAll(']', '')
                            .split(', ');
                        return NutritionItem(
                          label: nutrition[0],
                          unit: nutrition[1],
                        );
                      },
                    ),
                  ),
                ],
              ),

              const HorizontalDivider(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TitleText(text: 'Ingredients', showButton: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: widget.product.data['ingredients'].length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return IngredientItem(
                          number: '${index + 1}',
                          text: widget.product.data['ingredients'][index],
                        );
                      },
                    ),
                  ),
                ],
              ),
              const HorizontalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TitleText(text: 'Instructions', showButton: false),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: widget.product.data['instructions'].length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InstructionItem(
                          number: '${index + 1}',
                          text: widget.product.data['instructions'][index],
                          // images: const [
                          //   'assets/images/welcome_screen.jpg',
                          //   'assets/images/welcome_screen.jpg',
                          //   'assets/images/welcome_screen.jpg',
                          // ],
                        );
                      },
                    ),
                  ),
                ],
              ),

              // const SizedBox(height: 10),

              const HorizontalDivider(),
              // --------------------------------------------------------

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TitleText(text: 'Comments', showButton: true),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const CommentItem();
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CommentBox(),
                  ),
                ],
              ),

              const HorizontalDivider(),
              // --------------------------------------------------------

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TitleText(
                        text: 'More Recipes Like This', showButton: true),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: ProductCard(
                            username: 'Rayaan Yahaya',
                            userImage:
                                'http://localhost/v1/storage/buckets/64497203b2fc22dae964/files/644e6868b76f9b1fd527/view?project=6435978f59cab443127d&mode=admin',
                            title: 'Original Wasawasa Recipe',
                            productImage:
                                'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
