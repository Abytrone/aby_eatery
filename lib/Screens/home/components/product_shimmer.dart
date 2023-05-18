import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.0,
      height: 250.0,
      child: Shimmer.fromColors(
        baseColor: Colors.green,
        highlightColor: Colors.black,
        // baseColor: Colors.grey.shade300,
        // highlightColor: Colors.grey.shade100,
        child: const SizedBox(
          width: 180.0,
          height: 250.0,
        ),
      ),
    );
  }
}
