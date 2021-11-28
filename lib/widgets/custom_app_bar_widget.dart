import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'package:flutter/material.dart';

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
  bool status8 = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.needBackButton ? true : false,
      title: Text(
        'Love Calculator 2021',
        style: context.theme.textTheme.headline5,
      ),
      actions: <Widget>[
        _nightModeToggle(),
      ],
    );
  }

  Widget _nightModeToggle() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FlutterSwitch(
        width: 50.0,
        height: 25.0,
        toggleSize: 20.0,
        value: status8,
        borderRadius: 30.0,
        padding: 0.0,
        activeToggleColor: const Color(0xFF7209b7),
        inactiveToggleColor: Colors.grey.shade400,
        activeSwitchBorder: Border.all(
          color: const Color(0xFF7209b7),
          width: 3.0,
        ),
        inactiveSwitchBorder: Border.all(
          color: Colors.grey.shade500,
          width: 3.0,
        ),
        activeColor: const Color(0xFFB44FF8),
        inactiveColor: Colors.white,
        activeIcon: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/OOjs_UI_icon_moon-invert.svg/640px-OOjs_UI_icon_moon-invert.svg.png",
        ),
        inactiveIcon: Image.network(
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Sun_icon.svg/640px-Sun_icon.svg.png",
        ),
        onToggle: (val) {
          ThemeService().switchTheme();
          setState(() {
            status8 = val;
          });
        },
      ),
    );
  }
}
