import 'package:flutter/material.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: ColorResources.lightScaffoldBGcolor,
    backgroundColor: Colors.orange,
    primaryColor: ColorResources.mainLightColor,
    splashColor: const Color(0xffFF5CFF),
    disabledColor: Colors.grey[500],
    highlightColor: const Color(0xffFFADFF),
    hintColor: Colors.black,
    dividerColor: const Color(0xffFFD6FF),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorResources.mainLightColor),
    appBarTheme: const AppBarTheme(
      color: ColorResources.mainLightColor,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      bodyText1: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      bodyText2: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
      subtitle1: const TextStyle(fontWeight: FontWeight.w500),
      subtitle2:
          TextStyle(color: Colors.grey[300], fontWeight: FontWeight.w400),
      headline1: const TextStyle(),
      headline2: const TextStyle(),
      headline3: const TextStyle(),
      headline4:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      headline5: const TextStyle(),
      headline6: const TextStyle(),
      caption: const TextStyle(//color: kHintColor
          ),
    ).apply(bodyColor: Colors.white),
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    primaryColor: ColorResources.mainDarkColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorResources.mainDarkColor),
    appBarTheme: const AppBarTheme(
      color: ColorResources.mainDarkColor,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      bodyText1: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      bodyText2: const TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
      subtitle1: const TextStyle(fontWeight: FontWeight.w500),
      subtitle2:
          TextStyle(color: Colors.grey[300], fontWeight: FontWeight.w400),
      headline1: const TextStyle(),
      headline2: const TextStyle(),
      headline3: const TextStyle(),
      headline4:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      headline5: const TextStyle(),
      headline6: const TextStyle(),
      caption: const TextStyle(//color: kHintColor
          ),
    ).apply(bodyColor: Colors.white),
  );
}
