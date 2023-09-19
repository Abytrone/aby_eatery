import 'package:aby_eatery/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductsController productsController = Get.find();
    final TextEditingController search = TextEditingController();
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.03),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: search,
        decoration: InputDecoration(
          hintText: 'Search for Recipe',
          border: InputBorder.none,
          prefixIcon: IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              colorFilter: const ColorFilter.mode(
                kDarkLightColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              if (search.text != '') {
                productsController.searchProucts(search: search.text);
              } else {
                productsController.hasSearched(false);
              }
            },
            iconSize: 30,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(kPrimaryColor),
            ),
            icon: SvgPicture.asset(
              'assets/icons/send.svg',
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
