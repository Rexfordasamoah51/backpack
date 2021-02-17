import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/body.dart';
import '../components/bottom_navigation_bar.dart';
import '../cubit/bottom_navigator_controller_cubit.dart';

///[DashboardView] this holds the bottom navigation bottom
///
///it is basically the main house for the main screen
class DashboardView extends StatelessWidget {
  const DashboardView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => BottomNavigatorControllerCubit(),
      child: Scaffold(
        body: BlocBuilder<BottomNavigatorControllerCubit, int>(
            builder: (context, state) {
          return buildBody(state);
        }),
        bottomNavigationBar: BlocBuilder<BottomNavigatorControllerCubit, int>(
          builder: (context, state) {
            final _currentstate =
                context.watch<BottomNavigatorControllerCubit>();
            return buildBottomNavigationBar(_currentstate, context);
          },
        ),
      ),
    ));
  }
}
