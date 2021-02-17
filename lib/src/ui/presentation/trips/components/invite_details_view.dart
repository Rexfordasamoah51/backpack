import 'package:flutter/material.dart';
import 'package:sliding_card/sliding_card.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../global/widget/leading.dart';
import 'invite_card.dart';
import 'invite_card_size_config.dart';

class InviteDetailsView extends StatelessWidget {
  const InviteDetailsView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = SlidingCardController();
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Leading(
            text: 'Invite',
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: PhysicalModel(
              color: Colors.grey,
              elevation: 2,
              shadowColor: Colors.grey,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10),
                color: Colors.white,
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    Assets.images.dot.image(),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Your trip to ',
                        style: Theme.of(context).textTheme.bodyText1,
                        children: const [
                          TextSpan(
                              text: 'Ghana',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          InviteCard(
            onCardTapped: () {
              debugPrint('Card tapped controller can be used here ');
              if (controller.isCardSeparated == true) {
                controller.collapseCard();
              } else {
                controller.expandCard();
              }
            },
            slidingCardController: controller,
          ),
        ],
      )),
    );
  }
}
