import 'dart:io';

import 'package:backpack/gen/assets.gen.dart';
import 'package:backpack/src/ui/global/widget/leading.dart';
import 'package:christian_picker_image/christian_picker_image.dart';
import 'package:flutter/material.dart';

class AddImageToTrip extends StatefulWidget {
  @override
  _AddImageToTripState createState() => _AddImageToTripState();
}

class _AddImageToTripState extends State<AddImageToTrip> {
  List<File> images = [];

  void takeImage(BuildContext context) async {
    images = await ChristianPickerImage.pickImages(maxImages: 5);
    debugPrint(images.toString());
    Navigator.of(context).pop();
  }

  Future _pickImage(BuildContext context) async {
    showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          takeImage(context);
          return Center();
        });
  }

  List<int> index = List<int>.generate(5, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(bottom: 0, child: Assets.images.map.image()),
              const Leading(
                text: 'Photos',
              ),
              Center()
            ],
          ),
        )),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  _pickImage(context);
                },
                tooltip: 'Take a Photo',
                child: const Icon(Icons.photo_library),
              ),
            ),
          ],
        ));
  }
}
