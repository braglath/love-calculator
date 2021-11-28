import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CustomButton extends StatelessWidget {
  final String insideText;
  final void Function()? onPressedFunction;
  const CustomButton(
      {Key? key, required this.insideText, required this.onPressedFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressedFunction,
        child: Text(
          insideText,
          style: context.theme.textTheme.headline5,
        ));
  }
}
