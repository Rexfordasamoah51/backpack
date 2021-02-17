import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';

class StarterApp extends StatelessWidget {
  const StarterApp({Key key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.images.backpackIntro.image(),
      ),
    );
  }
}