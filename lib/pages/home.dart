import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:http/http.dart';
import 'package:new_love_calculator_2021/Controllers/love_percentage_controller.dart';
import 'package:new_love_calculator_2021/services/api_service.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';
import 'package:new_love_calculator_2021/widgets/Custom_bottom_nav_widget.dart';
import 'package:new_love_calculator_2021/widgets/custom_app_bar_widget.dart';
import 'package:new_love_calculator_2021/widgets/custom_button_widget.dart';
import 'package:new_love_calculator_2021/widgets/custom_chips_widget.dart';
import 'package:new_love_calculator_2021/widgets/custom_dragable_sheet_widget.dart';
import 'package:new_love_calculator_2021/widgets/custom_input_field_widget.dart';

// ignore: must_be_immutable
class MainHomePage extends StatefulWidget {
  final String title;
  const MainHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  bool status8 = false;
  bool isSwitchOn = false;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final LovePercentageController lovePercentageController =
      Get.put(LovePercentageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        needBackButton: false,
      ),
      // bottomNavigationBar: const CustomBottomNavBar(),
      body: _mainBody(),
    );
  }

  Widget _mainBody() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomChips(),
          CustomInputField(
            title: 'First Name',
            controller: firstNameController,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomChips(),
          CustomInputField(
            title: 'Second Name',
            controller: secondNameController,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
              insideText: 'Calculate',
              onPressedFunction: () {
                print(
                    'first name - ${firstNameController.text} \n second name - ${secondNameController.text}');
                APIservices.lovePercentage(
                    firstNameController.text, secondNameController.text);
                showModalBottomSheet(
                    // enableDrag: false,
                    // isDismissible: false,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => const CustomDragableBottomSheet());
              }),
        ],
      ),
    );
  }
}
