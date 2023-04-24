import 'package:aby_eatery/Screens/profile/settings.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants.dart';
import '../../services/auth_services.dart';
import '../home/product_detail.dart';
import '../recipes/components/recipe_product_card.dart';
import 'components/profile_info.dart';
import 'components/social_info.dart';
import 'components/social_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  final AuthServices authServices = AuthServices();
  Account? user;
  late TabController _tabController;
  @override
  void initState() {
    getUser();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  getUser() async {
    user = await authServices.get();
    print(user!.name);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => SettingScreen());
            },
            icon: const Icon(Iconsax.setting),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // shrinkWrap: true,
          children: [
            const SizedBox(height: 30),
            const PersonalInfo(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(thickness: 1, color: kDarkColor.withOpacity(0.2)),
            ),
            const SocialInfo(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Divider(thickness: 1, color: kDarkColor.withOpacity(0.2)),
            ),
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
              labelPadding: const EdgeInsets.symmetric(vertical: 10),
              unselectedLabelColor: kDarkColor.withOpacity(0.5),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: kPrimaryColor),
              ),
              unselectedLabelStyle: const TextStyle(fontFamily: 'Okine'),
              tabs: const [
                Text(
                  'Recipes',
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  'About',
                  style: TextStyle(fontSize: 17),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 5),
                    child: MasonryGridView.count(
                      padding: const EdgeInsets.all(0),
                      crossAxisCount: 2,
                      itemCount: 5,
                      crossAxisSpacing: 10,
                      shrinkWrap: true,
                      mainAxisSpacing: 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(() => const ProductDetailScreen());
                          },
                          child: const RecipeProductCard(
                            username: 'Rayaan Yahaya',
                            userImage:
                                'assets/images/pexels-pixabay-415829.jpg',
                            title: 'Original Wasawasa Recipe',
                            productImage:
                                'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2R8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          ),
                        );
                      },
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Identification of novel yeast strains: The study can identify and characterize novel yeast strains with superior fermentation performance and potential applications in various industries.',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                              thickness: 1, color: kDarkColor.withOpacity(0.2)),
                        ),
                        Text(
                          'Social Media',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                              thickness: 1, color: kDarkColor.withOpacity(0.2)),
                        ),
                        Text(
                          'More Info',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const PersonalInfoItem(
                          icon: 'assets/icons/call.svg',
                          text: '055 913 3666',
                        ),
                        const PersonalInfoItem(
                          icon: 'assets/icons/location.svg',
                          text: 'Ward K, Tamale',
                        ),
                        const PersonalInfoItem(
                          icon: 'assets/icons/global.svg',
                          text: 'www.abyeatery.com',
                        ),
                        const PersonalInfoItem(
                          icon: 'assets/icons/calender_tick.svg',
                          text: 'Joined since April 03, 2020',
                        ),
                        const PersonalInfoItem(
                          icon: 'assets/icons/chart.svg',
                          text: '23,443 views',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
