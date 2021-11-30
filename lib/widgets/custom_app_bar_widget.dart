import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final bool needBackButton;
  @override
  final Size preferredSize;

  CustomAppBar({Key? key, required this.needBackButton})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(

      automaticallyImplyLeading: widget.needBackButton ? true : false,
      centerTitle: true,
      title: Text(
        'Love Calculator 2021',
        style: context.theme.textTheme.headline6,
      ),
      actions: <Widget>[
        _nightModeToggle(),
      ],
    );
  }

  Widget _nightModeToggle() {
    return IconButton(
      onPressed: () => ThemeService().switchTheme(),
      icon: ThemeService().theme == ThemeMode.light
          ? const Icon(
              Icons.light_mode_rounded,
              color: Colors.amber,
            )
          : const Icon(
              Icons.dark_mode_sharp,
              color: Colors.white,
            ),
      splashRadius: 12,
      tooltip: 'Toggle Dark mode',
    );
  }
}
