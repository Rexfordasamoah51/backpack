import 'package:flutter/material.dart';

import '../../theme/ui_color/uicolors.dart';
import '../responsiveness/adaptive_sizes.dart';

class SmallNextBtn extends StatelessWidget {
  const SmallNextBtn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adapt.px(120),
      alignment: Alignment.center,
      width: Adapt.px(300),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: UiColors.uiBlue, width: 2)),
      child: Text('Next',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold, color: UiColors.uiBlue)),
    );
  }
}
