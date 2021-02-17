import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
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
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Search',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  Container(
                    width: 270,
                    margin: const EdgeInsets.only(top: 2),
                    child: const TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Search by user or place')),
                  ),
                  // ),
                ],
              ),
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
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jennifer',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      'Hey, How are you?',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                trailing: Text(
                  '9:00am',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
