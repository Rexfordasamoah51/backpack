import 'package:flutter/material.dart';
import 'package:flutter_slidercarousel/flutter_slidercarousel.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../global/widget/leading.dart';
import '../../../theme/ui_color/uicolors.dart';

class RequestDetailView extends StatelessWidget {
  const RequestDetailView({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Leading(
            text: 'Request',
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
          SliderCarousel(
            itemCount: 5,
            itemBuilder: (context, idx) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(image: Assets.images.backsplash)),
              );
            },
            itemWidth: 200,
            itemHeight: 400,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
             const CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.close),
              ),
             const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: UiColors.greyDark,
                child: Assets.images.messageCircle.image(),
              ),
             const SizedBox(
                width: 10,
              ),
              const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.check),
              ),
            ],
          )
        ],
      )),
    );
  }
}
