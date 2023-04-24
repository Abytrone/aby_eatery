import 'package:aby_eatery/constants.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({Key? key, required this.number, required this.text})
      : super(key: key);
  final String number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              number,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}
