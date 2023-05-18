import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class RecipeProductCard extends StatelessWidget {
  const RecipeProductCard({
    Key? key,
    required this.title,
    required this.productImage,
  }) : super(key: key);
  final String title;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 250,
        width: 180,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Positioned.fill(
              child: SizedBox(
                height: 250,
                width: 180,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder_potrait.png',
                    image: productImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [0.1, 1.0],
                    colors: [
                      Colors.black.withOpacity(0.7),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/pen.svg',
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
