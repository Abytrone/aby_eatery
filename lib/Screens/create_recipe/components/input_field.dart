import 'package:flutter/material.dart';

import '../../../constants.dart';

class AbyInputField extends StatelessWidget {
  const AbyInputField({
    super.key,
    this.label,
    required this.hintText,
    this.maxLines,
  });
  final String? label;
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label != null ? label! : '',
            style: const TextStyle(fontSize: 15),
          ),
          SizedBox(height: label != null ? 5 : 0),
          Container(
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: kDarkLightColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: kDarkColor.withOpacity(.5),
                  fontSize: 17,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AbyInputFieldSecond extends StatelessWidget {
  const AbyInputFieldSecond({
    super.key,
    required this.hintText,
  });
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: kDarkLightColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: kDarkColor.withOpacity(.5),
                fontSize: 17,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

class AbyInputFieldThird extends StatelessWidget {
  const AbyInputFieldThird({
    super.key,
    required this.hintText,
    this.maxLines,
  });
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          padding: const EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: kDarkLightColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: kDarkColor.withOpacity(.5),
                fontSize: 17,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

class AbyInputFieldFourth extends StatelessWidget {
  const AbyInputFieldFourth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
          color: kDarkLightColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Instruction',
            hintStyle: TextStyle(
              color: kDarkColor.withOpacity(.5),
              fontSize: 17,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
