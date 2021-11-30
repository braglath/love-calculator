import 'package:flutter/material.dart';
import 'package:new_love_calculator_2021/pages/home.dart';
import 'package:new_love_calculator_2021/utility/strings.dart';

class PageRoutes {
  static const String homePage = 'homePage';

  Map<String, WidgetBuilder> routes() {
    return {
      homePage: (context) => const MainHomePage(
            title: UsableStrings.mainPageTitle,
          ),
    };
  }
}
