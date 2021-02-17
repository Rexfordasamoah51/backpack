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
      return const FeedView();
      break;
    case 2:
      return const ActivityView();
      break;
    case 3:
      return const FeedView();
      break;
    case 4:
      return const FeedView();
      break;
    default:
  }
}
