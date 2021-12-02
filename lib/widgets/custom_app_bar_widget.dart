import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:new_love_calculator_2021/services/find_paid_user.dart';
import 'package:new_love_calculator_2021/services/razorpay_removeAds_payment.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/utility/strings.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

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
  late Razorpay razorpay;

  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, RemoveAds().handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, RemoveAds().handlerErrorFailure);
    razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET, RemoveAds().handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.needBackButton ? true : false,
      centerTitle: true,
      title: Text(
        UsableStrings.appBarTitle,
        style: context.theme.textTheme.headline6,
      ),
      leading: FindPaidUser().checkisPaidUser() ? null : _leadingIcon(),
      actions: <Widget>[
        _nightModeToggle(),
      ],
    );
  }

  Widget _leadingIcon() => IconButton(
        splashRadius: 12,
        tooltip: UsableStrings.noADSToolTip,
        icon: const Icon(
          Icons.notifications_off,
          color: Colors.white,
        ),
        onPressed: () {
          // print('razorpay to stop ads');
          RemoveAds().openCheckout(razorpay);
        },
      );

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
