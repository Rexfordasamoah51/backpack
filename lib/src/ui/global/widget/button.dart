import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


import '../responsiveness/adaptive_sizes.dart';

class Button extends StatelessWidget {
  const Button(
      {Key key, this.text, this.backgroundColor, this.textColor, this.tap})
      : super(key: key);

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback tap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        height: Adapt.px(120),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: Adapt.screenW(),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(50)),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold, color: textColor)),
      ),
    );
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
