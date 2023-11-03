import 'package:aby_eatery/Screens/profile/settings.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/products_controller.dart';
import '../../controllers/user_controller.dart';
import '../home/components/divider.dart';
import 'components/profile_info.dart';
import 'components/social_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserController userController = Get.find();
  final ProductsController productsController = Get.find();
  // late TabController _tabController;
  Account? user;
  // @override
  // void initState() {
  //   _tabController = TabController(
  //       length: userController.user.value.value!.prefs.data['role'] == 'admin'
  //           ? 2
  //           : 1,
  //       vsync: this);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: GoogleFonts.quicksand(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: Image.asset('assets/app_icon/foreground.png'),
          onPressed: () {
            // authServices.getUserProducts();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SettingScreen());
            },
            icon: const Icon(Iconsax.setting),
          )
        ],
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 30),
              const PersonalInfo(),
              // const HorizontalDivider(),
              // const SocialInfo(),
              const HorizontalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userController
                            .user.value.value!.prefs.data['description'] ??
                        'null',
                  ),
                  const HorizontalDivider(),
                  Text(
                    'Social Media',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  const SocialItem(
                    icon: 'assets/icons/whatsapp.svg',
                    text: 'WhatsApp',
                  ),
                  const SocialItem(
                    icon: 'assets/icons/snapchat.svg',
                    text: 'Snapchat',
                  ),
                  const SocialItem(
                    icon: 'assets/icons/facebook.svg',
                    text: 'Facebook',
                  ),
                  const SocialItem(
                    icon: 'assets/icons/twitter.svg',
                    text: 'Twitter',
                  ),
                  const SocialItem(
                    icon: 'assets/icons/instagram.svg',
                    text: 'Instagram',
                  ),
                  const SocialItem(
                    icon: 'assets/icons/telegram.svg',
                    text: 'Telegram',
                  ),
                  const HorizontalDivider(),
                  Text(
                    'More Info',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  PersonalInfoItem(
                    icon: 'assets/icons/call.svg',
                    text: userController.user.value.value!.phone,
                  ),
                  PersonalInfoItem(
                    icon: 'assets/icons/location.svg',
                    text: userController
                            .user.value.value!.prefs.data['address'] ??
                        'null',
                  ),
                  // PersonalInfoItem(
                  //   icon: 'assets/icons/global.svg',
                  //   text: userController
                  //           .user.value.value!.prefs.data['website'] ??
                  //       'null',
                  // ),
                  PersonalInfoItem(
                    icon: 'assets/icons/calender_tick.svg',
                    text:
                        'Joined since ${userController.user.value.value!.$createdAt.substring(0, 4)}',
                  ),
                  // PersonalInfoItem(
                  //   icon: 'assets/icons/chart.svg',
                  //   text:
                  //       // ignore: invalid_use_of_protected_member
                  //       '${userController.user.value.value!.prefs.data['views']} views',
                  // ),
                ],
              ),
              // TabBar(
              //   controller: _tabController,
              //   indicatorSize: TabBarIndicatorSize.tab,
              //   labelPadding: const EdgeInsets.symmetric(vertical: 10),
              //   unselectedLabelColor: kDarkColor.withOpacity(0.5),
              //   indicator: const UnderlineTabIndicator(
              //     borderSide: BorderSide(width: 4.0, color: kPrimaryColor),
              //   ),
              //   unselectedLabelStyle: const TextStyle(fontFamily: 'Okine'),
              //   tabs: [
              //     if (userController.user.value.value!.prefs.data['role'] ==
              //         'admin')
              //       const Text(
              //         'Recipes',
              //         style: TextStyle(fontSize: 17),
              //       ),
              //     const Text(
              //       'About',
              //       style: TextStyle(fontSize: 17),
              //     ),
              //   ],
              // ),
              // Expanded(
              //   child: TabBarView(
              //     controller: _tabController,
              //     children: [
              //       // ignore: invalid_use_of_protected_member
              //       if (userController.user.value.value!.prefs.data['role'] ==
              //           'admin')
              //         productsController.userProducts.value.value == null
              //             ? const Center(child: EmptyWidget())
              //             : RefreshIndicator(
              //                 onRefresh: () {
              //                   return productsController.getAuthUserProducts();
              //                 },
              //                 child: Padding(
              //                   padding:
              //                       const EdgeInsets.only(top: 10, right: 5),
              //                   child: MasonryGridView.count(
              //                     padding: const EdgeInsets.all(0),
              //                     crossAxisCount: 2,
              //                     itemCount: productsController.userProducts
              //                         .value.value!.documents.length,
              //                     crossAxisSpacing: 10,
              //                     shrinkWrap: true,
              //                     mainAxisSpacing: 0,
              //                     itemBuilder: (context, index) {
              //                       final products = productsController
              //                           .userProducts
              //                           .value
              //                           .value!
              //                           .documents[index];
              //                       return InkWell(
              //                         onTap: () {
              //                           Get.to(
              //                             () => ProductDetailScreen(
              //                               product: products,
              //                             ),
              //                           );
              //                         },
              //                         child: RecipeProductCard(
              //                           id: products.$id,
              //                           title: products.data['name'],
              //                           productImage:
              //                               'https://$endPoint/storage/buckets/$productPicturesBucket/files/${products.data['images'][0]}/view?project=$projectId',
              //                         ),
              //                       );
              //                     },
              //                   ),
              //                 ),
              //               ),

              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
