import 'package:backpack/gen/assets.gen.dart';
import 'package:backpack/src/backend/data/add_trip_info.dart';
import 'package:backpack/src/backend/data/add_trip_visbility_map.dart';
import 'package:backpack/src/ui/global/responsiveness/adaptive_sizes.dart';
import 'package:backpack/src/ui/global/widget/from_view.dart';
import 'package:backpack/src/ui/global/widget/leading.dart';
import 'package:backpack/src/ui/global/widget/small_button.dart';
import 'package:backpack/src/ui/presentation/addtrip/component/controllers.dart';
import 'package:backpack/src/ui/theme/ui_color/uicolors.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'component/cubit/addtrip_cubit.dart';
import 'component/cubit/datedepeature_cubit.dart';
import 'component/cubit/returndate_cubit.dart';

class AddTripView extends StatefulWidget {
  const AddTripView({Key key}) : super(key: key);

  @override
  _AddTripViewState createState() => _AddTripViewState();
}

class _AddTripViewState extends State<AddTripView> {
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
    Adapt.initContext(context);
    debugPrint(currentDate.day.toString());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(bottom: 0, child: Assets.images.map.image()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Leading(
                      text: "Let's add your trip",
                    ),
                    const Gap(20),
                    FromToView(
                      icon: Assets.images.mapPin.image(),
                      start: 'From',
                      name: AddTripControllers.fromController.text,
                    ),
                    FromToView(
                      icon: Assets.images.dot.image(),
                      start: 'To',
                      name: AddTripControllers.toController.text,
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text('With',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontSize: 16)),
                          const Gap(20),
                          Container(
                            width: 250,
                            margin: const EdgeInsets.only(top: 2),
                            child: TextField(
                                controller: AddTripControllers
                                    .tralvellingWithController,
                                decoration: const InputDecoration(
                                    hintText: 'who is travelling with you')),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    BlocProvider(
                      create: (context) => AddtripCubit(),
                      child: BlocBuilder<AddtripCubit, String>(
                        builder: (context, state) {
                          final visibility = context.watch<AddtripCubit>();
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text('Visibility',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontSize: 16)),
                                const Gap(20),
                                CupertinoRadioChoice(
                                    choices: genderMap,
                                    onChange: visibility.onGenderSelected,
                                    initialKeyValue: state),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
                          BlocProvider(
                            create: (context) => DatedepeatureCubit(),
                            child: BlocBuilder<DatedepeatureCubit, DateTime>(
                              builder: (context, state) {
                                final selectDate =
                                    context.read<DatedepeatureCubit>();
                                return GestureDetector(
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    await selectDate.selectDate(context);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: ListTile(
                                      leading: IconButton(
                                        onPressed: () {},
                                        icon:
                                            const Icon(CupertinoIcons.calendar),
                                      ),
                                      title: Text(
                                          'Depeature date(${state.day}/${state.month}/${state.year})',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: UiColors.greyDark)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          BlocProvider(
                            create: (context) => ReturndateCubit(),
                            child: BlocBuilder<ReturndateCubit, DateTime>(
                              builder: (context, state) {
                                final selectDate =
                                    context.read<ReturndateCubit>();
                                return GestureDetector(
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    await selectDate.selectDate(context);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    child: ListTile(
                                      leading: IconButton(
                                        onPressed: () {},
                                        icon:
                                            const Icon(CupertinoIcons.calendar),
                                      ),
                                      title: Text(
                                          'Return date (${state.day}/${state.month}/${state.year})',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: UiColors.greyDark)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Gap(50),
                          Center(
                            child: SmallButton(
                              tap: () => Navigator.of(context)
                                  .pushNamed('/add-image-to-trip'),
                              text: 'Done',
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
