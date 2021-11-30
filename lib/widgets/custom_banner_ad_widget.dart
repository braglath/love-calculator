import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:new_love_calculator_2021/services/google_ad_service.dart';

class CustomBannerAd extends StatelessWidget {
  const CustomBannerAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AdWidget(
        key: UniqueKey(),
        ad: AdMobService.createBannerAd()..load(),
      ),
    );
  }
}
