import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:new_love_calculator_2021/pages/home.dart';
import 'package:new_love_calculator_2021/services/google_ad_service.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/utility/page_routes.dart';
import 'package:new_love_calculator_2021/utility/strings.dart';
import 'package:new_love_calculator_2021/utility/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AdMobService.initialize();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: UsableStrings.mainPageTitle,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: const MainHomePage(title: UsableStrings.mainPageTitle),
      routes: PageRoutes().routes(),
    );
  }
}
