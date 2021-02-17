import 'package:flutter/material.dart';
import 'package:nice_intro/nice_intro.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../theme/ui_color/uicolors.dart';

class IntroView extends StatelessWidget {
  const IntroView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroScreens(
      onDone: () => Navigator.pushNamed(context, '/register-view'),
      onSkip: () => Navigator.pushNamed(context, '/register-view'),
      footerBgColor: UiColors.uiBlue,

      footerRadius: 18,
//      indicatorType: IndicatorType.CIRCLE,
      slides: [
        IntroScreen(
          title: 'Add trips',
          textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: FontFamily.poppins),
          imageAsset: Assets.images.two.path,
          description: '''
Easily add you create your trip, and let people know where you are heading''',
        ),
        IntroScreen(
          textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: FontFamily.poppins),
          title: 'Discover',
          imageAsset: Assets.images.friend.path,
          description:
              'Discover where people are going, and join them on thier trips',
        ),
        IntroScreen(
          textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: FontFamily.poppins),
          title: 'Invitations',
          imageAsset: Assets.images.air.path,
          description: 'Ask people to join on your trip',
        ),
        IntroScreen(
          textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: FontFamily.poppins),
          title: 'Ask them out',
          imageAsset: Assets.images.travel.path,
          description: 'Enjoy together with them',
        ),
      ],
    ));
  }
}
