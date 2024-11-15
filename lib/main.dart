import 'package:clario_test_task/consts/constants.dart';
import 'package:clario_test_task/consts/text_themes.dart';
import 'package:clario_test_task/helpers/routers/auto_app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

final _appRouter = AutoAppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Constants.appName,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(textTheme()),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
