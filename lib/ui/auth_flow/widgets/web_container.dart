import 'package:clario_test_task/consts/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class WebContainer extends StatelessWidget {
  final Widget child;

  const WebContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return child;
    }
    return Center(
      child: SizedBox(
        width: Constants.webMaxWidth,
        child: child,
      ),
    );
  }
}
