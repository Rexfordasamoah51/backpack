import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../theme/ui_color/uicolors.dart';


class Leading extends StatelessWidget {
  const Leading({Key key, this.text, this.endText}) : super(key: key);

  final String text;
  // ignore: diagnostic_describe_all_properties
  final VoidCallback endText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.back,
                size: 30,
              ),
              Text('back', style: Theme.of(context).textTheme.headline6),
            ],
          ),
        ),
        GestureDetector(
          onTap: endText,
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 20, color: UiColors.greyDark),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('text', text));
  }
}
