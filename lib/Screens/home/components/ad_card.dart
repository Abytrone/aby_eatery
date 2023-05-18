import 'package:flutter/material.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 60,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/placeholder_landscape.png',
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
