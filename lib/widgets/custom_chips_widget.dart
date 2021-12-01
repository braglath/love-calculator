import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:new_love_calculator_2021/services/gender_storage.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';
import 'package:new_love_calculator_2021/utility/strings.dart';

class CustomChips extends StatefulWidget {
  final bool isFirstGender;
  const CustomChips({Key? key, required this.isFirstGender}) : super(key: key);

  @override
  State<CustomChips> createState() => _CustomChipsState();
}

class _CustomChipsState extends State<CustomChips> {
  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;
  String _gender = '';
  final String _firstGender = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: _gender.isEmpty ? 'Select gender' : 'Selected gender - ',
            children: <TextSpan>[
              TextSpan(
                  text: _gender.isEmpty ? '' : _gender,
                  style: context.theme.textTheme.subtitle1),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isMaleSelected = true;
                      _gender = UsableStrings.genderMale;
                    });
                    if (widget.isFirstGender == true) {
                      GenderStorage().saveFirstGenderToBox(_gender);
                    } else {
                      GenderStorage().saveSecondGenderToBox(_gender);
                    }
                    print('gender storage - $_gender');
                  },
                  child: CircleAvatar(
                    backgroundColor: ThemeService().theme == ThemeMode.light
                        ? ColorResources.mainLightColor
                        : ColorResources.mainDarkColor,
                    radius: 15,
                    child: const Icon(
                      Icons.male,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isFemaleSelected = true;
                    _gender = UsableStrings.genderFemale;
                  });
                  if (widget.isFirstGender == true) {
                    GenderStorage().saveFirstGenderToBox(_gender);
                  } else {
                    GenderStorage().saveSecondGenderToBox(_gender);
                  }
                  print('gender storage - $_gender');
                },
                child: CircleAvatar(
                  backgroundColor: ThemeService().theme == ThemeMode.light
                      ? ColorResources.mainLightColor
                      : ColorResources.mainDarkColor,
                  radius: 15,
                  child: const Icon(
                    Icons.female,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
