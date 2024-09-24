import 'package:aby_eatery/constants.dart';
import 'package:flutter/material.dart';

// This is our  main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    platform: TargetPlatform.iOS,
    primaryColor: kPrimaryColor,
    brightness: Brightness.light,
    // scaffoldBackgroundColor: kLightBackgroundColor,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      // backgroundColor: Colors.transparent,
      // foregroundColor: kDarkColor,
    ),
    iconTheme: const IconThemeData(color: kDarkColor),
    textTheme: Theme.of(context).textTheme.apply(
          displayColor: kDarkColor,
          fontFamily: 'Okine',
        ),
    colorScheme: const ColorScheme.light(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: kDarkColor,
        fontFamily: 'Okine',
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      unselectedItemColor: kDarkColor,
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      unselectedIconTheme: IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  // Bydefault flutter provie us light and dark theme
  // we just modify it as our need
  return ThemeData.dark().copyWith(
    primaryColor: kPrimaryColor,
    brightness: Brightness.dark,
    // colorScheme: kContentColorDarkTheme,
    scaffoldBackgroundColor: kContentColorLightTheme,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(color: kLightBackgroundColor),
    textTheme: Theme.of(context).textTheme.apply(
          // bodyColor: kContentColorDarkTheme,
          displayColor: kLightBackgroundColor,
          fontFamily: 'Okine',
        ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: kPrimaryColor,
      secondary: kSecondaryColor,
      error: kErrorColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: kContentColorLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: kLightBackgroundColor.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor),
      showUnselectedLabels: true,
    ),
  );
}
