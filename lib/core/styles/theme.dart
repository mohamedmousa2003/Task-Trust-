import 'package:flutter/material.dart';
import 'colors.dart';

class MyTheme{
  static ThemeData themeData =ThemeData(
    scaffoldBackgroundColor: MyColors.background,
      appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor:  MyColors.background,
      scrolledUnderElevation: 0,
    )
  );
}