import 'package:backpack/gen/assets.gen.dart';
import 'package:backpack/src/ui/global/widget/from_view.dart';
import 'package:backpack/src/ui/global/widget/leading.dart';
import 'package:backpack/src/ui/theme/ui_color/uicolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchTicket extends StatefulWidget {
  const SearchTicket({Key key}) : super(key: key);

  @override
  _SearchTicketState createState() => _SearchTicketState();
}

class _SearchTicketState extends State<SearchTicket> {
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() => currentDate = pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        const Leading(
          text: 'Buy a ticket',
        ),
        const Gap(20),
        FromToView(
          icon: Assets.images.mapPin.image(),
          start: 'From',
          name: 'Oslo',
        ),
        FromToView(
          icon: Assets.images.dot.image(),
          start: 'To',
          name: 'London',
        ),
        const Gap(20),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dates',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 18)),
              GestureDetector(
                onTap: () async {
                  await _selectDate(context);
                },
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.calendar),
                    ),
                    title: Text('Depeature date',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 16, color: UiColors.greyDark)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await _selectDate(context);
                },
                child: Card(
                  elevation: 0,
                  child: ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.calendar),
                    ),
                    title: Text('Return date',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 16, color: UiColors.greyDark)),
                  ),
                ),
              ),
              const Gap(50),
            ],
          ),
        )
      ]),
    ));
  }
}
