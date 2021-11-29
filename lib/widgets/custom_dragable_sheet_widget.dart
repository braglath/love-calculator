import 'package:flutter/material.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';
import 'package:new_love_calculator_2021/widgets/custom_button_widget.dart';

class CustomDragableBottomSheet extends StatelessWidget {
  const CustomDragableBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return makeDismissible(
      context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        builder: (_, controller) => Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ThemeService().theme == ThemeMode.light
                ? ColorResources.lightScaffoldBGcolor
                : ColorResources.darkScaffoldBGcolor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: ListView(
            controller: controller,
            children: [
              const Icon(
                Icons.drag_handle,
                color: Colors.white,
              ),
              const Text(
                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of'),
              Center(
                child: CustomButton(
                  insideText: 'Close',
                  onPressedFunction: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeDismissible(BuildContext context, {required Widget child}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(
          onTap: () {},
          child: child,
        ),
      );
}
