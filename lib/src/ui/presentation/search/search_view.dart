import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import '../../../../gen/assets.gen.dart';
import '../../global/widget/feed_card.dart';
import '../../theme/ui_color/uicolors.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const Card1(),
              const Card(
                elevation: 1,
                margin: EdgeInsets.zero,
                child: TabBar(
                  indicatorColor: UiColors.uiYellow,
                  indicatorWeight: 5,
                  labelColor: UiColors.uiBlack,
                  unselectedLabelColor: UiColors.uiBlack,
                  tabs: [
                    Tab(
                      text: 'Trips',
                    ),
                    Tab(
                      text: 'People',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) => const FeedCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ListTile(
                        leading: CircularProfileAvatar(
                          '',
                          radius: 25,
                          backgroundColor: Colors.transparent,
                          borderWidth: 3, // sets border, default 0.0
                          initialsText: const Text(
                            ' AD',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          borderColor: Colors.brown,
                          elevation: 2,
                          foregroundColor: Colors.brown.withOpacity(0.5),

                          onTap: () {
                            debugPrint('adil');
                          }, // sets on tap

                          child: Assets.images.hub.image(fit: BoxFit.cover),
                        ),
                        title: Text(
                          'Jennifer',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        trailing: const Chip(
                            backgroundColor: Colors.transparent,
                            side: BorderSide(color: UiColors.uiBlue),
                            label: Text('Follow')),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Card1 extends StatefulWidget {
  const Card1({Key key}) : super(key: key);
  @override
  _Card1State createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  static final Map<String, String> genderMap = {
    'male': 'Male',
    'female': 'Female',
    'other': 'All',
  };

  String _selectedGender = genderMap.keys.first;

  @override
  Widget build(BuildContext context) {
    final genderSelectionTile = Material(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Gender',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.black),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 5),
          ),
          Center(
            child: CupertinoRadioChoice(
                choices: genderMap,
                onChange: onGenderSelected,
                initialKeyValue: _selectedGender),
          )
        ],
      ),
    );

    return ExpandableNotifier(
        child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: Column(
        children: <Widget>[
          ScrollOnExpand(
            scrollOnCollapse: false,
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToCollapse: true,
              ),
              header: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      CupertinoIcons.back,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 270,
                    margin: const EdgeInsets.only(top: 2),
                    child: const TextField(
                        decoration:
                            InputDecoration.collapsed(hintText: 'Search')),
                  ),
                  // ),
                ],
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  genderSelectionTile,
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Age Range',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  FlutterSlider(
                    values: const [30, 420],
                    rangeSlider: true,
                    max: 500,
                    min: 0,
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBar: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [UiColors.uiBlue, UiColors.uiRed]),
                          borderRadius: BorderRadius.circular(5)),
                      activeTrackBarHeight: 6,
                    ),
                    onDragging:
                        // ignore: avoid_annotating_with_dynamic
                        (handlerIndex, dynamic owerValue,
                            // ignore: avoid_annotating_with_dynamic
                            dynamic upperValue) {},
                  ),
                ],
              ),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }

  void onGenderSelected(String genderKey) {
    setState(() {
      _selectedGender = genderKey;
    });
  }
}
