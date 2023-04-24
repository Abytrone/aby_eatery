import 'package:flutter/material.dart';

import '../../../constants.dart';

class NutritionItem extends StatelessWidget {
  const NutritionItem({Key? key, required this.label, required this.unit})
      : super(key: key);
  final String label;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: kDarkColor,
                ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              unit,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: kPrimaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
