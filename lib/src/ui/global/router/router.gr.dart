// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/addtrip/add_trip_view.dart';
import '../../presentation/dashboard/view/dashboard_view.dart';
import '../../presentation/intro/intro_view.dart';
import '../../presentation/login/login_view.dart';
import '../../presentation/recovery/recover_account.dart';
import '../../presentation/register/register_view.dart';
import '../../presentation/search_ticket/search_ticket.dart';
import '../../presentation/splash/splash_view.dart';
import '../../presentation/starter/starter_app.dart';

class Routes {
  static const String starterApp = '/';
  static const String splashView = '/splash-view';
  static const String loginView = '/login-view';
  static const String registerView = '/register-view';
  static const String recoverAccountView = '/recover-account-view';
  static const String introView = '/intro-view';
  static const String dashboardView = '/dashboard-view';
  static const String addTripView = '/add-trip-view';
  static const String searchTicket = '/search-ticket';
  static const all = <String>{
    starterApp,
    splashView,
    loginView,
    registerView,
    recoverAccountView,
    introView,
    dashboardView,
    addTripView,
    searchTicket,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.starterApp, page: StarterApp),
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.registerView, page: RegisterView),
    RouteDef(Routes.recoverAccountView, page: RecoverAccountView),
    RouteDef(Routes.introView, page: IntroView),
    RouteDef(Routes.dashboardView, page: DashboardView),
    RouteDef(Routes.addTripView, page: AddTripView),
    RouteDef(Routes.searchTicket, page: SearchTicket),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StarterApp: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const StarterApp(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    SplashView: (data) {
      return PageRouteBuilder<bool>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SplashView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    LoginView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    RegisterView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const RegisterView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    RecoverAccountView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const RecoverAccountView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    IntroView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const IntroView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeft,
      );
    },
    DashboardView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const DashboardView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      );
    },
    AddTripView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AddTripView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      );
    },
    SearchTicket: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SearchTicket(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideBottom,
      );
    },
  };
}
