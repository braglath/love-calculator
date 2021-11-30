import 'package:flutter/material.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xffFFADFF).withOpacity(0.5),
    backgroundColor: Colors.orange,
    primaryColorLight: Colors.black,
    splashColor: const Color(0xffFF5CFF),
    disabledColor: Colors.grey[500],
    highlightColor: const Color(0xffFFADFF),
    hintColor: Colors.black,
    dividerColor: const Color(0xffFFD6FF),
    //

    snackBarTheme: const SnackBarThemeData(
        backgroundColor: ColorResources.mainLightColor, elevation: 4),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: ColorResources.mainLightColor,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        side: const BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorResources.mainLightColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
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
      headline4: const TextStyle(fontWeight: FontWeight.bold),
      headline5: const TextStyle(),
      headline6: const TextStyle(),
      caption: const TextStyle(//color: kHintColor
          ),
    ).apply(bodyColor: Colors.white, fontFamily: 'josefin_sans'),
  );
  static final dark = ThemeData.dark().copyWith(
    primaryColor: ColorResources.mainDarkColor,
    scaffoldBackgroundColor: Color(0xffFFADFF).withOpacity(0.5),
    splashColor: const Color(0xffD41DED),
    disabledColor: Colors.grey[500],
    highlightColor: const Color(0xffDB42F0),
    hintColor: Colors.black,
    dividerColor: const Color(0xffE67BF4),
    //

    snackBarTheme: const SnackBarThemeData(
        backgroundColor: ColorResources.mainDarkColor, elevation: 4),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: ColorResources.mainDarkColor,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        side: const BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorResources.mainDarkColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
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
      headline4: const TextStyle(fontWeight: FontWeight.bold),
      headline5: const TextStyle(),
      headline6: const TextStyle(),
      caption: const TextStyle(//color: kHintColor
          ),
    ).apply(bodyColor: Colors.white, fontFamily: 'josefin_sans'),
  );
}
