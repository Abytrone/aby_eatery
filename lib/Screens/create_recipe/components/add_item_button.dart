import 'package:flutter/material.dart';

import '../../../constants.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: onPressed,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 17,
                )),
                backgroundColor: MaterialStateProperty.all(kSecondaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add),
                  const SizedBox(width: 20),
                  Text(
                    text, // 'Add Nutritional Item',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 17,
                          color: kPrimaryColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
