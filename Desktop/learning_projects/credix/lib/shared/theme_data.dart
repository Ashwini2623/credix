import 'package:credix/shared/constants.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: kWhiteColor,
  useMaterial3: false,
  primaryColor: kBlueColor,
  appBarTheme:
      const AppBarTheme(elevation: 0, titleSpacing: 0, centerTitle: true),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 3.0,
    shadowColor: kWhiteColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    foregroundColor: kWhiteColor,
    backgroundColor: kDarkBlue,
  )),
);
