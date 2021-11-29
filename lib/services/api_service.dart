import 'package:http/http.dart' as http;
import 'package:new_love_calculator_2021/Models/love_percentage_model.dart';
import 'package:new_love_calculator_2021/utility/assets_urls.dart';

class APIservices {
 static Future<LovePercentageModel> lovePercentage(
      String firstName, String secondName) async {
    var url = Uri.parse(
        'https://love-calculator.p.rapidapi.com/getPercentage?sname=$secondName&fname=$firstName');
    http.Response response = await http.get(url, headers: {
      'x-rapidapi-host': APIstrings.rapidAPIhostUrl,
      'x-rapidapi-key': APIstrings.apiKey
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return lovePercentageModelFromJson(jsonString);
    } else {
      var jsonString = response.body;
      return lovePercentageModelFromJson(jsonString);
    }
  }
}
