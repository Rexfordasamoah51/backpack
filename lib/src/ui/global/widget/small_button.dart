import 'package:backpack/src/ui/global/responsiveness/adaptive_sizes.dart';
import 'package:backpack/src/ui/theme/ui_color/uicolors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key key,
    this.text,
    this.tap,
  }) : super(key: key);
  final String text;
  final VoidCallback tap;
  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);
    return GestureDetector(
      onTap: tap,
      child: Container(
        alignment: Alignment.center,
        height: Adapt.px(100),
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: UiColors.uiBlue, width: 2)),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 16, color: UiColors.uiBlue)),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(ObjectFlagProperty.has('tap', tap));
  }
}
