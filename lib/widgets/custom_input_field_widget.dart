import 'package:flutter/material.dart';

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
        style: const TextStyle(
            color: Colors.white,
            fontFamily: 'josefin_sans',
            fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: title,
          labelStyle: const TextStyle(
              color: Colors.white,
              fontFamily: 'josefin_sans',
              fontWeight: FontWeight.bold),
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
