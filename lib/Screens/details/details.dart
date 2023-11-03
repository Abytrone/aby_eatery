import 'package:aby_eatery/Models/item.dart';
import 'package:aby_eatery/components/app_bar.dart';
import 'package:aby_eatery/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/ingredients.dart';
import 'components/price_and_buy.dart';
import 'components/title.dart';
import 'components/vitamins.dart';

class DetailsScreen extends StatelessWidget {
  final Item item;

  const DetailsScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(context,
          leading: IconButton(
              icon: SvgPicture.asset('assets/icons/back.svg'),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: 'Detail',
          actions: <Widget>[
            IconButton(
                icon: SvgPicture.asset('assets/icons/dots.svg'),
                onPressed: () {})
          ]),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.2),
            padding: EdgeInsets.only(top: size.height * 0.2),
            height: size.height * 0.8,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding * 5),
                topRight: Radius.circular(kDefaultPadding * 5),
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                  kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleBar(item: item),
                    const SizedBox(height: kDefaultPadding),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Detail',
                          style: TextStyle(fontSize: 18),
                        ),
                        // QtyCounter(),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Text(
                      item.description,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Vitamins(item: item),
                    const SizedBox(height: kDefaultPadding),
                    const Text(
                      'Ingredients',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Ingredients(item: item),
                    const SizedBox(height: kDefaultPadding * 2),
                    PriceAndBuy(item: item)
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: item.id,
            child: Image.asset(
              item.image,
              height: size.height * 0.4,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
