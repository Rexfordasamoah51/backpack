import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../theme/ui_color/uicolors.dart';
import '../responsiveness/adaptive_sizes.dart';

class ButtonFlat extends StatelessWidget {
  const ButtonFlat(
      {Key key, this.text, this.backgroundColor, this.textColor, this.tap})
      : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function(
      Function startLoading, Function stopLoading, ButtonState btnState) tap;
  @override
  Widget build(BuildContext context) {
    return ArgonButton(
      height: Adapt.px(120),
      width: MediaQuery.of(context).size.width * 0.9,
      minWidth: MediaQuery.of(context).size.width * 0.2,
      borderRadius: 50,
      color: UiColors.uiBlue,
      loader: Container(
        padding: const EdgeInsets.all(10),
        child: const SpinKitRotatingCircle(
          color: Colors.white,
          // size: loaderWidth ,
        ),
      ),
      onTap: tap,
      child: const Text(
        'Continue',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
      ),
    );
    // return GestureDetector(
    //   onTap: tap,
    //   child: Container(
    //     height: Adapt.px(120),
    //     alignment: Alignment.center,
    //     margin: const EdgeInsets.symmetric(horizontal: 10),
    //     width: Adapt.screenW(),
    //     decoration: BoxDecoration(
    //         color: backgroundColor, borderRadius: BorderRadius.circular(50)),
    //     child: Text(text,
    //         style: Theme.of(context)
    //             .textTheme
    //             .headline6
    //             .copyWith(fontWeight: FontWeight.bold, color: textColor)),
    //   ),
    // );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    // ignore: cascade_invocations
    properties.add(StringProperty('text', text));
    // ignore: cascade_invocations
    properties.add(ColorProperty('textColor', textColor));
    // ignore: cascade_invocations
    properties.add(DiagnosticsProperty<Function>('tap', tap));
  }
}
