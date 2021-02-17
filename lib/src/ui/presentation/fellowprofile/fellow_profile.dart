import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../global/router/router.gr.dart';
import '../../theme/ui_color/uicolors.dart';

class FellowProfile extends StatelessWidget {
  const FellowProfile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topRight,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              top: 50,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: Assets.images.backsplash)),
            child: GestureDetector(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, Routes.splashView, (route) => false),
              child: Row(
                children: const[
                   Icon(
                    CupertinoIcons.back,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height - 150),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 6,
                  decoration: BoxDecoration(
                      color: UiColors.greyDark,
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alex',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          'Very Experienced',
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                    Chip(
                      label: const Text('Fellow'),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.white),
                      backgroundColor: UiColors.uiBlue,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Next Trip',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Ghana',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: UiColors.greyLight),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '50,0000mi',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          'Backpacker',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: UiColors.greyLight),
                        )
                      ],
                    ),
                    const Icon(Icons.image)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
