import 'package:animations/animations.dart';
import 'package:backpack/src/ui/presentation/addtrip/add_trip_init.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../theme/ui_color/uicolors.dart';
import '../addtrip/add_trip_view.dart';

const double _fabDimension = 56;

class Trips extends StatelessWidget {
  const Trips({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   const _transitionType = ContainerTransitionType.fade;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Trips',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  const SizedBox(
                    height: 10,
                  ),
                  PhysicalModel(
                    color: Colors.grey,
                    elevation: 2,
                    shadowColor: Colors.grey,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 10),
                      color: Colors.white,
                      height: 50,
                      width: double.infinity,
                      child: const TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Enter a name of a city'),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Requests',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) => const TripCard(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('Invites',
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) => const TripCard(),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: OpenContainer(
                transitionType: _transitionType,
                openBuilder: (context, _) {
                  return const AddTripInit();
                },
                closedElevation: 6,
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(_fabDimension / 2),
                  ),
                ),
                closedColor: UiColors.uiBlue,
                closedBuilder: (context, openContainer) {
                  return SizedBox(
                    height: _fabDimension,
                    width: _fabDimension,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text('Add a trip',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

class TripCard extends StatelessWidget {
  const TripCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
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
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 80,
          width: 270,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.cover, image: Assets.images.backsplash)),
          child: Column(
            children: [
              ListTile(
                trailing: Text('WED,4 NOV',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                leading: Container(
                  height: 20,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child:
                      Text('7', style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text('Ghana to Accra',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
