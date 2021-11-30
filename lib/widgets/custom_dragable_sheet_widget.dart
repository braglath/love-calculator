import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:new_love_calculator_2021/Animations/opacity_animation.dart';
import 'package:new_love_calculator_2021/Models/love_percentage_model.dart';
import 'package:new_love_calculator_2021/services/api_service.dart';
import 'package:new_love_calculator_2021/services/gender_storage.dart';
import 'package:new_love_calculator_2021/services/theme_service.dart';
import 'package:new_love_calculator_2021/utility/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_love_calculator_2021/widgets/custom_button_widget.dart';
import 'package:new_love_calculator_2021/widgets/custom_card_background_widget.dart';
import 'package:new_love_calculator_2021/widgets/custom_counter_widget.dart';

class CustomDragableBottomSheet extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController secondNameController;
  const CustomDragableBottomSheet(
      {Key? key,
      required this.firstNameController,
      required this.secondNameController})
      : super(key: key);

  @override
  State<CustomDragableBottomSheet> createState() =>
      _CustomDragableBottomSheetState();
}

class _CustomDragableBottomSheetState extends State<CustomDragableBottomSheet> {
  String _firstGender = '';
  String _secondGender = '';
  int _lovePercentage = 0;

  @override
  Widget build(BuildContext context) {
    return makeDismissible(context,
        child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          maxChildSize: 0.7,
          minChildSize: 0.2,
          builder: (_, controller) => Container(
            padding: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: ThemeService().theme == ThemeMode.light
                  ? ColorResources.lightScaffoldBGcolor
                  : ColorResources.darkScaffoldBGcolor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [const CustomCardBackground(), mainContent()],
            ),
          ),
        ));
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

  Widget mainContent() {
    return FutureBuilder<LovePercentageModel>(
      future: APIservices().lovePercentage(
          widget.firstNameController.text, widget.secondNameController.text),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: SpinKitPumpingHeart(
            color: ThemeService().theme == ThemeMode.light
                ? ColorResources.mainDarkColor
                : ColorResources.mainLightColor,
            size: 50,
          ));
        } else {
          LovePercentageStorage()
              .saveLovePercentage(int.parse(snapshot.data!.percentage));
          _lovePercentage = LovePercentageStorage().loadLovePercentage();
          print('love percentage $_lovePercentage');

          return CustomOpacityAnimation(
            duration: const Duration(seconds: 2),
            child: Stack(
              children: [
                _lovePercentage >= 0 && _lovePercentage <= 25
                    ? Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Lottie.asset('assets/lottie/leaffalling.json',
                              fit: BoxFit.cover),
                        ),
                      )
                    : _lovePercentage > 25 && _lovePercentage <= 50
                        ? Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: Lottie.asset(
                                  'assets/lottie/simplehearts.json',
                                  fit: BoxFit.cover),
                            ),
                          )
                        : _lovePercentage > 50 && _lovePercentage <= 75
                            ? Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: Lottie.asset(
                                      'assets/lottie/heartfly.json',
                                      fit: BoxFit.cover),
                                ),
                              )
                            : _lovePercentage > 75 && _lovePercentage <= 100
                                ? Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Lottie.asset(
                                          'assets/lottie/heartbanner.json',
                                          fit: BoxFit.cover),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: const Icon(
                          Icons.drag_handle,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            direction: Axis.vertical,
                            children: [
                              Icon(
                                _firstGender.contains('Male')
                                    ? Icons.male
                                    : Icons.female,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                snapshot.data!.fname,
                                style: context.theme.textTheme.headline6,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                            child: Lottie.asset(
                                'assets/lottie/heartresult.json',
                                fit: BoxFit.contain),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            alignment: WrapAlignment.center,
                            runAlignment: WrapAlignment.center,
                            direction: Axis.vertical,
                            children: [
                              Icon(
                                _secondGender.contains('Female')
                                    ? Icons.female
                                    : Icons.male,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                snapshot.data!.sname,
                                style: context.theme.textTheme.headline6,
                              ),
                            ],
                          )
                        ],
                      ),
                      CustomCounter(
                        percentage: double.parse(snapshot.data!.percentage),
                      ),
                      
                      Text(
                        snapshot.data!.result,
                        style: context.theme.textTheme.headline4,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                Align(alignment: Alignment.bottomCenter, child: _allButtons()),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _allButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              insideText: '', icon: Icons.save_alt, onPressedFunction: () {}),
          const SizedBox(
            width: 10,
          ),
          CustomButton(
              insideText: '', icon: Icons.share, onPressedFunction: () {}),
          const SizedBox(
            width: 10,
          ),
          CustomButton(
              insideText: '',
              icon: Icons.close,
              onPressedFunction: () {
                Navigator.of(context).pop();
              }),
        ],
      );
}
