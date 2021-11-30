import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';
import 'package:new_love_calculator_2021/utility/strings.dart';

class CustomInputField extends StatelessWidget {
  final String title;
  final TextEditingController controller;

  const CustomInputField(
      {Key? key, required this.title, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Colors.white,
        keyboardType: TextInputType.name,
        controller: controller,
        // autovalidate: true,
        validator: (val) {
          if (val!.isEmpty) {
            return UsableStrings.nameIsEmpty;
          }
          if (val.length > 12) {
            return UsableStrings.moreThan12Charc;
          }
          return null;
        },
        style: const TextStyle(
            color: Colors.white,
            fontFamily: 'josefin_sans',
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: title,
          labelStyle: context.theme.textTheme.headline6,
          fillColor: Colors.white,
          errorStyle: context.theme.textTheme.subtitle2?.copyWith(
              color: ThemeService().theme == ThemeMode.light
                  ? ColorResources.mainLightColor
                  : ColorResources.mainDarkColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              width: 2,
              color: ThemeService().theme == ThemeMode.light
                  ? ColorResources.mainLightColor
                  : ColorResources.mainDarkColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
        ));
  }
}
