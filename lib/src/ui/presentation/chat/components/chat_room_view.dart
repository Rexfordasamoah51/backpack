import 'package:flutter/material.dart';

import '../../../global/widget/leading.dart';
import '../../../theme/ui_color/uicolors.dart';

class ChatRoomView extends StatelessWidget {
  const ChatRoomView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Leading(
              text: 'Lisa',
            ),
            const Spacer(),
            PhysicalModel(
              color: Colors.white,
              elevation: 5,
              child: TextField(
                controller: _controller,
                onChanged: (value) {},
                decoration: InputDecoration(
                    filled: true,
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Icon(
                        Icons.add,
                        color: UiColors.uiBlue,
                      ),
                    ),
                    suffixIcon: Icon(
                      _controller.text.isEmpty ? Icons.mic : Icons.send,
                      color: UiColors.uiBlack,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
