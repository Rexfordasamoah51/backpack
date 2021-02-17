import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../global/model/validator.dart';
import '../../global/router/router.gr.dart';
import '../../global/widget/small_next_btn.dart';
import 'components/recover_action.dart';

class RecoverAccountView extends StatelessWidget {
  const RecoverAccountView({Key key}) : super(key: key);
  static const route = Routes.recoverAccountView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.back,
                      size: 30,
                    ),
                    Text('back', style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Recover your account',
                  style: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const Gap(50),
              Form(
                // key: RecoverAction.recoverFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (EmailValidator.validate(value) == false) {
                            return 'Invalid  Email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          RecoverAction.recoverCredentials.userEmail = value;
                        },
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 18),
                        decoration: const InputDecoration(hintText: 'Email'),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(50),
              const SmallNextBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

