import 'package:credix/routing/route_path_constants.dart';
import 'package:credix/routing/routing.dart';
import 'package:credix/shared/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(routes: $appRoutes, initialLocation: kSplashPage),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
    );
  }
}
