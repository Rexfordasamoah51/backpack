import 'package:backpack/src/ui/theme/ui_color/uicolors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FromToView extends StatelessWidget {
  const FromToView({
    Key key,
    this.icon,
    this.start,
    this.name,
  }) : super(key: key);
  final Widget icon;
  final String start;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              icon,
              const Gap(10),
              Text(
                start,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: UiColors.greyDark, fontSize: 18),
              ),
              const Gap(10),
              Text(name,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 18)),
            ],
          ),
        )
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('name', name))
      ..add(StringProperty('start', start));
  }
}
