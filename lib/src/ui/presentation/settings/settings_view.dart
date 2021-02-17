import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global/widget/leading.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Leading(
            text: 'Settings',
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: PhysicalModel(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              elevation: 3,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    LabelTextSettings(
                      text: Text('Login with Touch ID',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18
                          )),
                      end: Switch(value: true, onChanged: (value) {}),
                    ),
                    LabelTextSettings(
                      text: Text('Deactivate account',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18
                          )),
                      end: const Icon(
                        CupertinoIcons.forward,
                        size: 30,
                      ),
                    ),
                    LabelTextSettings(
                      text: Text('Terms of service',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18
                          )),
                      end: const Icon(
                        CupertinoIcons.forward,
                        size: 30,
                      ),
                    ),
                    LabelTextSettings(
                      text: Text('Privacy Policy',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18
                          )),
                      end: const Icon(
                        CupertinoIcons.forward,
                        size: 30,
                      ),
                    ),
                    LabelTextSettings(
                      text: Text('About',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18
                          )),
                      end: const Icon(
                        CupertinoIcons.forward,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: PhysicalModel(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              elevation: 3,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    LabelTextSettings(
                      text: Text('Make my account private',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18
                          )),
                      end: Switch(value: true, onChanged: (value) {}),
                    ),
                    LabelTextSettings(
                      text: Text('Enable 2FA',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18
                          )),
                      end: Switch(value: true, onChanged: (value) {}),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class LabelTextSettings extends StatelessWidget {
  const LabelTextSettings({Key key, this.end, this.text}) : super(key: key);

  final Widget end;
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: text,
      trailing: end,
    );
  }
}
