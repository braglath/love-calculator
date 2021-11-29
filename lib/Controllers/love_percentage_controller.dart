import 'package:get/state_manager.dart';
import 'package:new_love_calculator_2021/Models/love_percentage_model.dart';
import 'package:new_love_calculator_2021/services/api_service.dart';

class LovePercentageController extends GetxController {
  var lovePercentageList = <LovePercentageModel>[].obs;
  void fetchPercentage() async {
    var percentage = await APIservices.lovePercentage('braglath', 'santhiya');
    lovePercentageList.value = percentage as List<LovePercentageModel>;
  }
}
