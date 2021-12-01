import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:new_love_calculator_2021/services/gender_storage.dart';
import 'package:new_love_calculator_2021/services/google_ad_service.dart';
import 'package:new_love_calculator_2021/utility/strings.dart';
import 'package:new_love_calculator_2021/widgets/custom_app_bar_widget.dart';
import 'package:new_love_calculator_2021/widgets/custom_background_widget.dart';
import 'package:new_love_calculator_2021/widgets/custom_banner_ad_widget.dart';
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
  final _form = GlobalKey<FormState>();
  String firstGender = '';
  String secondGender = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      GenderStorage().deleteFirstGender();
      GenderStorage().deleteSecondGender();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        needBackButton: false,
      ),
      extendBody: true,
      bottomNavigationBar: const CustomBannerAd(),
      body: Stack(
        children: [
          const CustomBackground(),
          Center(
              child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  reverse: true,
                  child: _mainBody())),
        ],
      ),
    );
  }

  Widget _mainBody() {
    return Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CustomChips(
                isFirstGender: true,
              ),
              CustomInputField(
                title: UsableStrings.homeFirstName,
                controller: firstNameController,
              ),
              const SizedBox(
                height: 25,
              ),
              const CustomChips(
                isFirstGender: false,
              ),
              CustomInputField(
                title: UsableStrings.homeSecondName,
                controller: secondNameController,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                  insideText: UsableStrings.homeCalculate,
                  icon: Icons.calculate,
                  onPressedFunction: () {
                    // print(
                    //     'first name - ${firstNameController.text} \n second name - ${secondNameController.text}');
                    setState(() {
                      firstGender = GenderStorage().loadFirstGenderFromBox();
                      secondGender = GenderStorage().loadSecondGenderFromBox();
                    });
                    if (FocusScope.of(context).isFirstFocus) {
                      FocusScope.of(context).requestFocus(FocusNode());
                    }

                    if (_form.currentState!.validate()) {
                      if (firstGender.isNotEmpty && secondGender.isNotEmpty) {
                        showModalBottomSheet(
                            // enableDrag: false,
                            // isDismissible: false,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => CustomDragableBottomSheet(
                                  firstNameController: firstNameController,
                                  secondNameController: secondNameController,
                                ));
                      } else {
                        final snackBar = SnackBar(
                          duration: const Duration(seconds: 3),
                          content: Text(
                            UsableStrings.homeSelectAGender,
                            style: context.theme.textTheme.headline6,
                            textAlign: TextAlign.center,
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    }
                  }),
            ],
          ),
        ));
  }
}
