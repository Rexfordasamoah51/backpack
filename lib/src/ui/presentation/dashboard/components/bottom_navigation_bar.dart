//{@Buttom  Navigation}  design for the dashbaord bottom navigation
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/ui_color/uicolors.dart';
import '../cubit/bottom_navigator_controller_cubit.dart';

Theme buildBottomNavigationBar(
    BottomNavigatorControllerCubit _currentstate, BuildContext context) {
  final checkState = context.watch<BottomNavigatorControllerCubit>().state;
  return Theme(
    data: ThemeData(canvasColor: Colors.white),
    child: BottomNavigationBar(
      selectedItemColor: UiColors.uiBlack,
      unselectedItemColor: Colors.blueGrey,
      showUnselectedLabels: true,
      currentIndex: _currentstate.state,
      onTap: (index) {
        switch (index) {
          case 0:
            context.read<BottomNavigatorControllerCubit>().changeToHome();
            break;
          case 1:
            context.read<BottomNavigatorControllerCubit>().changeToExplore();
            break;
          case 2:
            context.read<BottomNavigatorControllerCubit>().changeToWallets();
            break;
          case 3:
            context.read<BottomNavigatorControllerCubit>().changeToReward();
            break;
          case 4:
            context.read<BottomNavigatorControllerCubit>().changeToProfile();
            break;
          default:
        }
      },
      items: [
        BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: checkState == 0 ? UiColors.uiBlack : null,
            )),
        BottomNavigationBarItem(
            label: 'Message',
            icon: Icon(CupertinoIcons.chat_bubble_fill,
                color: checkState == 1 ? UiColors.uiBlack : null)),
        BottomNavigationBarItem(
            label: 'Activity',
            icon: Icon(Icons.notifications,
                color: checkState == 2 ? UiColors.uiBlack : null)),
        BottomNavigationBarItem(
            label: 'Trips',
            icon: Icon(CupertinoIcons.location_solid,
                color: checkState == 3 ? UiColors.uiBlack : null)),
        BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(CupertinoIcons.person_solid,
                color: checkState == 4 ? UiColors.uiBlack : null))
      ],
    ),
  );
}
