import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/utility/assets_urls.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';
import 'package:new_love_calculator_2021/utility/strings.dart';

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
        UsableStrings.appBarTitle,
        style: context.theme.textTheme.headline6,
      ),
      leading: IconButton(
        splashRadius: 12,
        tooltip: UsableStrings.noADSToolTip,
        icon: const Icon(
          Icons.notifications_off,
          color: Colors.white,
        ),
        onPressed: () {
          print('razorpay to stop ads');
        },
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
      tooltip: UsableStrings.toggleIconToolTip,
    );
  }
}
