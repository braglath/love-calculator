import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';

class CustomScreenshotSaved {
  void screenshotSaved() {
    Get.defaultDialog(
        backgroundColor: ThemeService().theme == ThemeMode.light
            ? ColorResources.mainLightColor
            : ColorResources.mainDarkColor,
        title: 'Screenshot saved successfully',
        content: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.done,
              color: ThemeService().theme == ThemeMode.light
                  ? ColorResources.mainLightColor
                  : ColorResources.mainDarkColor,
            )),
        titleStyle: const TextStyle(color: Colors.white, fontSize: 22),
        confirm: const Text(
          'Confirm',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onConfirm: () => Get.back());
  }
}
