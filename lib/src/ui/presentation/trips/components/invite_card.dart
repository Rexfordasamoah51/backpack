import 'package:flutter/material.dart';
import 'package:sliding_card/sliding_card.dart';

import 'invite_card_back.dart';
import 'invite_card_front.dart';
import 'invite_card_size_config.dart';



///This is the main Invite card 
///it regroups the InviteFrontCard 
///and InviteBacktCard together 
///using my dart package ''SlidingCard''
class InviteCard extends StatefulWidget {
  const InviteCard({
    Key key,
    this.slidingCardController , @required this.onCardTapped
  }) : super(key: key);
 
  final  SlidingCardController slidingCardController;
  final Function onCardTapped;

  @override
  _InviteCardState createState() => _InviteCardState();
}

class _InviteCardState extends State<InviteCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        debugPrint('Well the card was tapped');
        widget.onCardTapped();
      },
          child: SlidingCard(
        slimeCardElevation: 0.5,
       // slidingAnimationReverseCurve: Curves.bounceInOut,
        cardsGap: SizeConfig.safeBlockVertical,
        controller: widget.slidingCardController,
        slidingCardWidth: SizeConfig.horizontalBloc * 90,
        visibleCardHeight: SizeConfig.safeBlockVertical * 27,
        hiddenCardHeight: SizeConfig.safeBlockVertical * 15,
        frontCardWidget: InviteFrontCard(
          imgLink: 'not needed anymore',
          patienName: '@jenifer',
          patienSurname: 'Maxico to Ghana',
          InviteDate: '12 Jan 2020 ',
          InviteTime: '12Am',
          onInfoTapped: () {
            debugPrint('info pressed');
            widget.slidingCardController.expandCard();
          },
          onDecline: () {
            debugPrint('Declined');
          },
          onAccep: () {
            debugPrint('Accepted');
          },
          onRedCloseButtonTapped: (){
            widget.slidingCardController.collapseCard();
          },
        ),
        backCardWidget:InviteBackCard(
          onPhoneTapped: (){debugPrint('Phone tapped');},
          patientComment: 'Do you wanna go with us?'
        ),
      ),
    );
  }
}