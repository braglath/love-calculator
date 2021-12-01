import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';
import 'package:new_love_calculator_2021/widgets/custom_screenshot_saved_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class SaveScreenshot {
  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_');
    final name = 'new_love_calculator_2021_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    // print(' save screenshot - $result');
    if (result['errorMessage'] == null) {
      CustomScreenshotSaved().screenshotSaved();
    }

    return result['filePath'];
  }
}
