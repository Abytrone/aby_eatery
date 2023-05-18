import 'package:flutter/material.dart';

import '../constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.labelText,
  }) : super(key: key);
  final void Function()? onPressed;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: onPressed,
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                  horizontal: 130,
                  vertical: 17,
                )),
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
              child: Text(
                labelText,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 17, color: kWhiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
