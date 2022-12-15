import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = Color(0xff39A552);
  static Color whiteColor = Color(0xffffffff);
  static Color blackColor = Color(0xff303030);
  static Color textColor = Color(0xff4F5A69);
  static Color sportColor = Color(0xffC91C22);
  static Color healthColor = Color(0xffED1E79);
  static Color enviromentColor = Color(0xff4882CF);
  static Color politicsColor = Color(0xff003E90);
  static Color businessColor = Color(0xffCF7E48);
  static Color scienceColor = Color(0xffF2D352);

  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      color: primaryColor,
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
        color: whiteColor,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
