import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';

class CustomChips extends StatefulWidget {
  CustomChips({Key? key}) : super(key: key);

  @override
  State<CustomChips> createState() => _CustomChipsState();
}

class _CustomChipsState extends State<CustomChips> {
  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;
  String _gender = '';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _gender.isEmpty
            ? const Text('Select gender')
            : Text('Selected gender - $_gender'),
        SizedBox(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isMaleSelected = true;
                      _gender = 'Male';
                    });
                  },
                  child: const CircleAvatar(
                    radius: 15,
                    child: Icon(Icons.male),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _isFemaleSelected = true;
                    _gender = 'Female';
                  });
                },
                child: const CircleAvatar(
                  radius: 15,
                  child: Icon(Icons.female),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
