import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

// final ProductsController productsController = ProductsController();

class CoverImage extends StatelessWidget {
  const CoverImage({
    super.key,
    required this.onTap,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kDarkLightColor.withOpacity(0.5),
          border: Border.all(color: kDarkLightColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/image.svg',
              width: 90,
              colorFilter: const ColorFilter.mode(
                kDarkLightColor,
                BlendMode.srcIn,
              ),
            ),
            const Text(
              'Add cover image',
              style: TextStyle(color: kDarkLightColor, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class CoverImageSelected extends StatelessWidget {
  const CoverImageSelected({
    super.key,
    required this.onTap,
    required this.file,
  });
  final void Function()? onTap;
  final File file;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 350,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            border: Border.all(color: kDarkLightColor, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
