import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

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
            return "Name cannot be empty";
          }
          if (val.length > 12) {
            return "Do not enter more than 12 characters";
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
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xffEF466F),
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
