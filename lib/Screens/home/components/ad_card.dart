import 'package:cached_network_image/cached_network_image.dart';
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
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.cover,
          placeholder: (context, url) => Image.asset(
            'assets/images/placeholder_landscape.png',
            fit: BoxFit.cover,
          ),
          errorWidget: (context, url, error) => Image.asset(
            'assets/images/placeholder_landscape.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
