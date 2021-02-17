// ignore: prefer_relative_imports
import 'package:backpack/src/ui/global/widget/button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../global/responsiveness/adaptive_sizes.dart';
import '../../theme/ui_color/uicolors.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    debugPrint('Splash Branch');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetGenImage(Assets.images.backsplash.path))),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              const Gap(200),
              Assets.images.backpack.image(
                fit: BoxFit.scaleDown,
              ),
              const Text(
                'Travel with People, make new Friend',
                style: TextStyle(
                    fontFamily: FontFamily.poppins,
                    color: UiColors.greyLighter),
              ),
              const Spacer(),
              Button(
                tap: () => Navigator.pushNamed(context, '/intro-view'),
                text: 'Sign up',
                backgroundColor: UiColors.greyLighter,
                textColor: UiColors.uiBlue,
              ),
              const Gap(20),
              Button(
                tap: () => Navigator.pushNamed(context, '/login-view'),
                text: 'Log In',
                backgroundColor: UiColors.uiBlue,
                textColor: UiColors.greyLighter,
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
