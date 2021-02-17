import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../theme/ui_color/uicolors.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
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
                      Text('back',
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      'You',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 20, color: UiColors.greyDark),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Activity',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  Text(
                    '125 people are following you',
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
               
                itemCount: 10,
                itemBuilder: (context, index) => const ActivitySection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivitySection extends StatelessWidget {
  const ActivitySection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircularProfileAvatar(
            '',
            radius: 30,
            backgroundColor: Colors.transparent,
            borderWidth: 3, // sets border, default 0.0
            initialsText: const Text(
              ' AD',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            borderColor: Colors.brown,
            elevation: 5,
            foregroundColor: Colors.brown.withOpacity(0.5),

            onTap: () {
              debugPrint('adil');
            }, // sets on tap

            child: Assets.images.hub.image(fit: BoxFit.cover),
          ),
          Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rexford started following you',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '15 hours ago',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: UiColors.greyLight),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Chip(
                    label: Text('Accept'),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                width: 250,
                color: Colors.black,
              ),
             
            ],
          )
        ],
      ),
    );
  }
}
