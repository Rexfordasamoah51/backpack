import 'package:backpack/src/ui/presentation/chat/chat_view.dart';
import 'package:backpack/src/ui/presentation/settings/settings_view.dart';
import 'package:backpack/src/ui/presentation/trips/trip_view.dart';
import 'package:flutter/material.dart';

import '../../Activity/activity_view.dart';
import '../../feed/feed_view.dart';

//{@Body} screens navigating based on the current index.
// ignore: missing_return
Widget buildBody(int itemBuild) {
  switch (itemBuild) {
    case 0:
      return const FeedView();
      break;
    case 1:
      return const ChatView();
      break;
    case 2:
      return const ActivityView();
      break;
    case 3:
      return const Trips();
      break;
    case 4:
      return const SettingsView();
      break;
    default:
  }
}
