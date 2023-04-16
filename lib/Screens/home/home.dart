import 'package:aby_eatery/Models/item.dart';
import 'package:aby_eatery/Screens/home/components/categories.dart';
import 'package:aby_eatery/Screens/home/components/item_card.dart';
import 'package:aby_eatery/components/app_bar.dart';
import 'package:aby_eatery/components/bottom_nav.dart';
import 'package:aby_eatery/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/appwrite_server.dart';
import 'components/filter.dart';
import 'components/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthServices authServices = AuthServices();
  @override
  void initState() {
    // authServices.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          leading: Transform.translate(
              offset: const Offset(kDefaultPadding * 0.5, 0),
              child: IconButton(
                  icon: Image.asset('assets/images/user.png'),
                  onPressed: () {})),
          title: '',
          actions: <Widget>[
            IconButton(
                icon: SvgPicture.asset('assets/icons/notification.svg'),
                onPressed: () {})
          ]),
      bottomNavigationBar: const BottomNavBar(),
      extendBody: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: SafeArea(
          // bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find the\nBest Health for You',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: kDefaultPadding),
              const SearchBar(),
              Row(children: [
                FilterButton(
                  tap: () {},
                ),
                const Expanded(child: Categories())
              ]),
              const SizedBox(height: kDefaultPadding),
              const Text(
                'Popular',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              MasonryGridView.count(
                padding: const EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: demoItems.length,
                crossAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                mainAxisSpacing: 0,
                itemBuilder: (context, index) {
                  return ItemCard(item: demoItems[index], index: index);
                },
                // staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
