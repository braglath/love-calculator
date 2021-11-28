import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:new_love_calculator_2021/services/api_service.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/widgets/custom_app_bar_widget.dart';
import 'package:new_love_calculator_2021/widgets/custom_button_widget.dart';

// ignore: must_be_immutable
class MainHomePage extends StatefulWidget {
  final String title;
  MainHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _counter = 0;

  bool status8 = false;

  bool isSwitchOn = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        needBackButton: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: context.textTheme.headline1,
            ),
            CustomButton(
                insideText: 'Calculate',
                onPressedFunction: () {
                  _incrementCounter();
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: ColorResources.mainLightColor,
        onPressed: () {
          APIservices().lovePercentage('Braglath', 'Santhiya');
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
