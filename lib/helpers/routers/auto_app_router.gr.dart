// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:clario_test_task/ui/auth_flow/sign_up_screen/sign_up_screen.dart'
    as _i1;
import 'package:clario_test_task/ui/auth_flow/sign_up_screen/sign_up_screen_view_model.dart'
    as _i4;
import 'package:flutter/material.dart' as _i3;

/// generated route for
/// [_i1.SignUpScreen]
class SignUpRoute extends _i2.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i3.Key? key,
    required _i4.SignUpScreenViewModel viewModel,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(
            key: key,
            viewModel: viewModel,
          ),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SignUpRouteArgs>();
      return _i1.SignUpScreen(
        key: args.key,
        viewModel: args.viewModel,
      );
    },
  );
}

class SignUpRouteArgs {
  const SignUpRouteArgs({
    this.key,
    required this.viewModel,
  });

  final _i3.Key? key;

  final _i4.SignUpScreenViewModel viewModel;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key, viewModel: $viewModel}';
  }
}
