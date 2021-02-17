import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../global/responsiveness/adaptive_sizes.dart';
import '../../theme/ui_color/uicolors.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Adapt.initContext(context);

    return Scaffold(
      body: Stack(
        children: [
          Assets.images.backsplash.image(
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 250,
          ),
          Container(
            height: MediaQuery.of(context).size.height - 350,
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.back,
                            size: 30,
                            color: Colors.white,
                          ),
                          Container(
                            height: 20,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Text('4',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('day trip',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                ListTile(
                  leading: Text(
                    'Bali',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  trailing: Text(
                    'IN ROUTE',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 16,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height - 300),
            padding: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
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
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // ignore: lines_longer_than_80_chars
                        'Adipisicing dolor dolor laboris ex ipsum commodo officia. Est cillum culpa ea magna excepteur sunt sint velit deserunt tempor cupidatat reprehenderit ex. Minim ut deserunt mollit labore. Enim sint qui fugiat velit pariatur incididunt exercitation id est consequat velit ex eiusmod laborum. Reprehenderit proident ',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          CircularProfileAvatar(
                            '',
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            borderWidth: 3, // sets border, default 0.0
                            initialsText: const Text(
                              ' AD',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white),
                            ),
                            borderColor: Colors.brown,
                            elevation: 5,
                            foregroundColor: Colors.brown.withOpacity(0.5),

                            onTap: () {
                              debugPrint('adil');
                            }, // sets on tap

                            child: Assets.images.hub.image(fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: CircularProfileAvatar(
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
                              foregroundColor: Colors.brown.withOpacity(0.5),

                              onTap: () {
                                debugPrint('adil');
                              }, // sets on tap

                              child: Assets.images.hub.image(fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: CircularProfileAvatar(
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
                              foregroundColor: Colors.brown.withOpacity(0.5),

                              onTap: () {
                                debugPrint('adil');
                              }, // sets on tap

                              child: Assets.images.hub.image(fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
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
          Positioned(
            left: 50,
            right: 50,
            top: MediaQuery.of(context).size.height - 320,
            child: const Chip(
                labelPadding: EdgeInsets.only(left: 20, right: 20),
                backgroundColor: UiColors.uiYellow,
                label: Text('Join')),
          ),
        ],
      ),
    );
  }
}
