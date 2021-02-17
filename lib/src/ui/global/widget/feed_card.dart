import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../theme/ui_color/uicolors.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.black,
        ),
        title: Text(
          'Jennifer',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        trailing: Text(
          '2 hours ago',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Card(
          elevation: 3,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 220,
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Assets.images.backsplash)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ListTile(
                              leading: Container(
                                height: 20,
                                width: 40,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Text('7',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              trailing: Stack(
                                children: [
                                  CircularProfileAvatar(
                                    '',
                                    radius: 22,
                                    backgroundColor: Colors.transparent,
                                    borderWidth: 3, // sets border, default 0.0
                                    initialsText: const Text(
                                      ' AD',
                                      style: TextStyle(
                                          fontSize: 40, color: Colors.white),
                                    ),
                                    borderColor: Colors.brown,
                                    elevation: 5,
                                    foregroundColor:
                                        Colors.brown.withOpacity(0.5),

                                    onTap: () {
                                      debugPrint('adil');
                                    }, // sets on tap

                                    child: Assets.images.hub
                                        .image(fit: BoxFit.cover),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: CircularProfileAvatar(
                                      '',
                                      radius: 22,
                                      backgroundColor: Colors.transparent,
                                      borderWidth:
                                          3, // sets border, default 0.0
                                      initialsText: const Text(
                                        ' AD',
                                        style: TextStyle(
                                            fontSize: 40, color: Colors.white),
                                      ),
                                      borderColor: Colors.brown,
                                      elevation: 5,
                                      foregroundColor:
                                          Colors.brown.withOpacity(0.5),

                                      onTap: () {
                                        debugPrint('adil');
                                      }, // sets on tap

                                      child: Assets.images.hub
                                          .image(fit: BoxFit.cover),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 50),
                                    child: CircularProfileAvatar(
                                      '',
                                      radius: 22,
                                      backgroundColor: Colors.transparent,
                                      borderWidth:
                                          3, // sets border, default 0.0
                                      initialsText: const Text(
                                        ' AD',
                                        style: TextStyle(
                                            fontSize: 40, color: Colors.white),
                                      ),
                                      borderColor: Colors.brown,
                                      elevation: 5,
                                      foregroundColor:
                                          Colors.brown.withOpacity(0.5),

                                      onTap: () {
                                        debugPrint('adil');
                                      }, // sets on tap

                                      child: Assets.images.hub
                                          .image(fit: BoxFit.cover),
                                    ),
                                  ),
                                ],
                              ),
                              title: Text('day trip',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ))),
                          ListTile(
                            leading: Text(
                              'Bali',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            trailing: Text(
                              'ON TRIP',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                      fontSize: 16,
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      left: 50,
                      right: 50,
                      child: Chip(
                          labelPadding: EdgeInsets.only(left: 20, right: 20),
                          backgroundColor: UiColors.uiYellow,
                          label: Text('Join')),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  children: [
                    Text(
                      'Velit ea sint est excepteur nostrud magna irure.',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.black),
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 10,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.favorite),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.share)
                          ],
                        ),
                        const Icon(Icons.tag)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
