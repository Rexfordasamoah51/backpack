import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../global/widget/feed_card.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              trailing: const Icon(
                Icons.search,
                size: 30,
              ),
              leading: Text('Traveling to?',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: "Enter a name of city you're traveling to"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) => const Travellers(),
              ),
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) => const FeedCard(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, bottom: 10),
                    child: Text('Popular destinations',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 220,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (context, index) => const FeedCardSmall(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class FeedCardSmall extends StatelessWidget {
  const FeedCardSmall({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: 170,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2,
        child: Container(
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: Assets.images.backsplash)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Bali'.toUpperCase(),
              style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}

class Travellers extends StatelessWidget {
  const Travellers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProfileAvatar(
            '',
            radius: 30,
            backgroundColor: Colors.transparent,

            initialsText: const Text(
              ' AD',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            borderColor: Colors.brown,
          
            foregroundColor: Colors.brown.withOpacity(0.5),

            onTap: () {
              debugPrint('adil');
            }, // sets on tap

            child: Assets.images.two.image(fit: BoxFit.cover),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'London',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}


