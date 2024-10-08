import 'package:aby_eatery/components/empty_widget.dart';
import 'package:aby_eatery/controllers/comments_controller.dart';
import 'package:appwrite/models.dart';
import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';
import '../../services/constants.dart';
import 'components/comment_box.dart';
import 'components/comment_item.dart';
import 'components/detail_appbar.dart';
import 'components/divider.dart';
import 'components/ingredients_item.dart';
import 'components/instruction_item.dart';
import 'components/nutrition_item.dart';
import 'components/title_text.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);
  final Document product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _current = 0;
  // final carousel.CarouselController _controller = carousel.CarouselController();
  final List<String> imgList = [];
  final CommentController commentController = Get.find();

  @override
  void initState() {
    // if (imgList == []) {
    for (var i = 0; i < widget.product.data['images'].length; i++) {
      imgList.add(widget.product.data['images'][i]);
    }
    // }
    commentController.getComments(dietid: widget.product.$id);
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
                  carousel.CarouselSlider(
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
                                    'https://$endPoint/storage/buckets/$productPicturesBucket/files/$item/view?project=$projectId',
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
                    // carouselController: _controller,
                    options: carousel.CarouselOptions(
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
                              // onTap: () => _controller.animateToPage(entry.key),
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
              const SizedBox(height: 5),
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
                  Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: commentController.loading.isTrue
                            ? Lottie.asset(
                                'assets/animations/95944-loading-animation.json',
                                repeat: true,
                              )
                            : commentController.comments.value.value == null
                                ? const Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: EmptyWidget(),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: commentController.comments.value
                                        .value!.comment.documents.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final comment = commentController
                                          .comments.value.value!.comment;
                                      // final user = commentController
                                      //     .comments.value.value!.user;
                                      return CommentItem(
                                        comment: comment.documents[index],
                                        // user: user.documents[0],
                                      );
                                    },
                                  ),
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CommentBox(
                      dietId: widget.product.$id,
                    ),
                  ),
                ],
              ),

              // const HorizontalDivider(),
              // // --------------------------------------------------------

              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 20),
              //       child: TitleText(
              //           text: 'More Recipes Like This', showButton: true),
              //     ),
              //     SizedBox(
              //       height: 250,
              //       child: ListView.builder(
              //         itemCount: 5,
              //         scrollDirection: Axis.horizontal,
              //         shrinkWrap: true,
              //         itemBuilder: (context, index) {
              //           return const Padding(
              //             padding: EdgeInsets.only(left: 10),
              //             child: ProductCard(
              //               username: 'Rayaan Yahaya',
              //               userImage:
              //                   'https://cloud.appwrite.io/v1/storage/buckets/644ef4f24ccfdc5336f8/files/64bd357b3edd3e051892/view?project=646a7e8ad278150d5bd7&mode=admin',
              //               title: 'Original Wasawasa Recipe',
              //               productImage:
              //                   'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //   ],
              // ),
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
