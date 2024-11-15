import 'package:auto_route/auto_route.dart';
import 'package:clario_test_task/helpers/routers/auto_app_router.gr.dart';
import 'package:clario_test_task/ui/auth_flow/sign_up_screen/sign_up_screen.dart';
import 'package:clario_test_task/ui/auth_flow/sign_up_screen/sign_up_screen_view_model.dart';

List<AutoRoute> authRouter() {
  return [
    _signUpPage(),
  ];
}

AutoRoute _signUpPage() {
  return AutoRoute(
    path: '/',
    initial: true,
    page: PageInfo(
      SignUpRoute.page.name,
      builder: (data) {
        if (data.args != null) return SignUpRoute.page.builder(data);
        final viewModel = SignUpScreenViewModel();
        return SignUpScreen(viewModel: viewModel);
      },
    ),
    type: const RouteType.custom(),
  );
}
