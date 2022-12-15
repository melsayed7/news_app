import 'package:flutter/material.dart';
import 'package:news_app/component/style/my_color.dart';

class MyTheme {

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: MyColor.primaryColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
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
    ),
  );
}
