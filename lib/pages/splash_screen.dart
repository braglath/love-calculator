import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:new_love_calculator_2021/pages/home.dart';
import 'package:new_love_calculator_2021/utility/assets_urls.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Lottie.asset(AssetsUrls.splashscreen, fit: BoxFit.cover)),
        nextScreen: MainHomePage(title: 'New Love Calculator 2021'),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: ColorResources.splashscreenBGcolor);
  }
}
