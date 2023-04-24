import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar buildAppBar(BuildContext context,
    {required String title,
    required List<Widget> actions,
    required Widget leading}) {
  return AppBar(
    // backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: GoogleFonts.quicksand(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    centerTitle: false,
    leading: leading,
    actions: actions,
  );
}
