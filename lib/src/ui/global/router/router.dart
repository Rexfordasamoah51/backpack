import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

import '../../presentation/dashboard/view/dashboard_view.dart';
import '../../presentation/intro/intro_view.dart';
import '../../presentation/login/login_view.dart';
import '../../presentation/recovery/recover_account.dart';
import '../../presentation/register/register_view.dart';
import '../../presentation/splash/splash_view.dart';
import '../../presentation/starter/starter_app.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute<bool>(
        page: StarterApp,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        initial: true),
    CustomRoute<bool>(
      page: SplashView,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute<dynamic>(
      page: LoginView,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute<dynamic>(
      page: RegisterView,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute<dynamic>(
      page: RecoverAccountView,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute<dynamic>(
      page: IntroView,
      transitionsBuilder: TransitionsBuilders.slideLeft,
    ),
    CustomRoute<dynamic>(
        page: DashboardView,
        transitionsBuilder: TransitionsBuilders.slideBottom)
  ],
)
class $Router {}
