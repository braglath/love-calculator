import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:new_love_calculator_2021/widgets/custom_screenshot_saved_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

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
      CustomScreenshotSaved().screenshotSaved(() => Get.back());
    }

    return result['filePath'];
  }

  Future saveAndShare(Uint8List bytes) async {
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/new_love_calculator_2021.png');
    image.writeAsBytesSync(bytes);
    print('save and share - $image');
    const text = 'New Love Calculator 2021 \n Download the app now!';
    await Share.shareFiles([image.path], text: text);
  }
}
