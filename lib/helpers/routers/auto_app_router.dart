import 'package:auto_route/auto_route.dart';
import 'package:clario_test_task/helpers/routers/auth_router.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AutoAppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [...authRouter()];
}
