import 'package:credix/features/login_page/login_page.dart';
import 'package:credix/features/naigation_bar/navigation_bar.dart';
import 'package:credix/features/register_page/register_page.dart';
import 'package:credix/features/splash_screen/splash_screen.dart';
import 'package:credix/features/welcome_page/welcome_page.dart';
import 'package:credix/routing/route_path_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routing.g.dart';

@TypedGoRoute<LoginPageRoute>(path: kLoginPage)
@immutable
class LoginPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<WelcomePageRoute>(path: kWelcomePage)
@immutable
class WelcomePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WelcomePage();
  }
}

@TypedGoRoute<RegisterPageRoute>(path: kRegisterPage)
@immutable
class RegisterPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return RegisterPage();
  }
}

@TypedGoRoute<NavigationPageRoute>(path: kNavigationPage)
@immutable
class NavigationPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const NavigationBarPage();
  }
}

@TypedGoRoute<SplashPageRoute>(path: kSplashPage)
@immutable
class SplashPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}
