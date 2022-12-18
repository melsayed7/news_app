import 'package:flutter/material.dart';
import 'package:news_app/shared/style/my_color.dart';

class MyTheme {

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: MyColor.primaryColor,
      centerTitle: true,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: MyColor.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      headline2: TextStyle(
        color: MyColor.whiteColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      subtitle1: TextStyle(
        color: MyColor.blackColor,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: TextStyle(
        color: MyColor.textColor,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: TextStyle(
        color: MyColor.whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
