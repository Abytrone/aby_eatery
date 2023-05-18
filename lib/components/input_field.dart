import 'package:flutter/material.dart';

import '../constants.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.labelText,
    this.hintText,
    this.textCapitalization,
  }) : super(key: key);
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final TextCapitalization? textCapitalization;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIconColor: kDarkColor,
        suffixIcon: suffixIcon,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor),
        ),
      ),
      obscureText: obscureText ?? false,
      validator: validator,
    );
  }
}
