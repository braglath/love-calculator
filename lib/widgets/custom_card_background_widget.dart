import 'package:flutter/material.dart';
import 'package:new_love_calculator_2021/Animations/opacity_animation.dart';
import 'package:new_love_calculator_2021/utility/assets_urls.dart';

class CustomCardBackground extends StatelessWidget {
  const CustomCardBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOpacityAnimation(
      duration: const Duration(seconds: 3),
      child: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Colors.black, Colors.black12],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ).createShader(bounds),
        blendMode: BlendMode.darken,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            image: DecorationImage(
              image: AssetImage(AssetsUrls.customCardLightBackgound),

              /// change this to your  image directory
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            ),
          ),
        ),
      ),
    );
  }
}
