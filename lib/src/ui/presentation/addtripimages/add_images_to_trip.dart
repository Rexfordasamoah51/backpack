import 'dart:io';

import 'package:backpack/gen/assets.gen.dart';
import 'package:backpack/src/ui/global/widget/leading.dart';
import 'package:backpack/src/ui/theme/ui_color/uicolors.dart';
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
              Center(
                  child: Container(
                height: 530,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 38,
                            right: 0,
                            child: Container(
                              height: 150,
                              width: 140,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(Assets.images.rec.path)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: IconButton(
                                onPressed: (){
                                  print('Hello');
                                },
                                icon:  Icon(
                                  Icons.camera_alt_outlined,
                                  // size: 40,
                                  // color: UiColors.uiBlue,
                                ),
                              ),
                            ),
                          ),
                          GridView.builder(
                              itemCount: images.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    images.removeAt(index);
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 300,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: FileImage(
                                                File(images[index].path))),
                                        borderRadius: BorderRadius.circular(5)),
                                  ),
                                );
                              }),
                        ],
                      ),
                    )),
              ))
            ],
          ),
        )),
        // floatingActionButton: Column(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.only(top: 16.0),
        //       child: FloatingActionButton(
        //         onPressed: () {
        //           // _pickImage(context);
        //         },
        //         tooltip: 'Take a Photo',
        //         child: const Icon(Icons.photo_library),
        //       ),
        //     ),
        //   ],
        // ));
    );}
}
