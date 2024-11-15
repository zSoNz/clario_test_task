import 'package:auto_route/auto_route.dart';
import 'package:clario_test_task/helpers/routers/auth_router.dart';
import 'package:flutter/material.dart';

abstract class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AutoAppRouter extends RootStackRouter {
  @override
  GlobalKey<NavigatorState> get navigatorKey => NavigationService.navigatorKey;

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [...authRouter()];
}
