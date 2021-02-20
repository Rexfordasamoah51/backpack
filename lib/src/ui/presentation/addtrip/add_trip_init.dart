import 'package:backpack/src/backend/data/add_trip_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:backpack/gen/assets.gen.dart';
import 'package:backpack/src/ui/global/widget/leading.dart';
import 'package:backpack/src/ui/global/widget/small_button.dart';
import 'package:backpack/src/ui/theme/ui_color/uicolors.dart';

import 'add_trip_view.dart';
import 'component/controllers.dart';

class AddTripInit extends StatelessWidget {
  const AddTripInit({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(bottom: 0, child: Assets.images.map.image()),
                Column(
                  children: [
                    const Leading(
                      text: "Let's add your trip",
                    ),
                    const Gap(20),
                    SearchTripCountry(
                      icon: Assets.images.mapPin.image(),
                      start: 'From',
                      controller: AddTripControllers.fromController,
                    ),
                    SearchTripCountry(
                      icon: Assets.images.dot.image(),
                      start: 'To',
                      controller: AddTripControllers.toController,
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        TicketDetail(),
                        TicketDetail(),
                        TicketDetail(),
                      ],
                    ),
                    const Gap(50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Assets.images.mapPin.image(),
                              const Gap(10),
                              Text(
                                'Paris',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: UiColors.greyDark, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Assets.images.mapline.image(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text(
                                'Berlin',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: UiColors.greyDark, fontSize: 18),
                              ),
                              const Gap(10),
                              Assets.images.dot.image(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Assets.images.card.image(),
                              const Gap(20),
                              Text(
                                'Need a ticket?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SmallButton(
                          tap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.pushNamed(
                              context,
                              '/add-trip-view',
                            );
                          },
                          text: 'Next',
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TicketDetail extends StatelessWidget {
  const TicketDetail({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Duration',
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16),
        ),
        Text(
          '2hrs 25mins',
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16),
        ),
      ],
    );
  }
}

class SearchTripCountry extends StatelessWidget {
  const SearchTripCountry(
      {Key key, this.icon, this.start, this.name, this.controller})
      : super(key: key);
  final Widget icon;
  final String start;
  final String name;
  final TextEditingController controller;
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
              Container(
                width: 250,
                margin: const EdgeInsets.only(top: 2),
                child: TextField(
                    controller: controller,
                    decoration: const InputDecoration.collapsed(
                        hintText: 'Place name')),
              ),
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
      ..add(StringProperty('start', start))
      ..add(
          DiagnosticsProperty<TextEditingController>('controller', controller));
  }
}
