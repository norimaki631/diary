import 'package:diary/my_page/my_page.dart';
import 'package:diary/sign_in/sign_in_page.dart';
import 'package:diary/sign_in/sign_up_page.dart';
import 'package:diary/time_line/time_line_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: const SignInRoute().location,
    routes: $appRoutes,
  );
}

@TypedGoRoute<SignInRoute>(
  path: '/signIn',
)
class SignInRoute extends GoRouteData {
  const SignInRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const SignInPage();
}

@TypedGoRoute<SignUpRoute>(
  path: '/signUp',
)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const SignUpPage();
}

@TypedGoRoute<TimeLineRoute>(
  path: '/TimeLine',
)
class TimeLineRoute extends GoRouteData {
  const TimeLineRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const TimeLinePage();
}

@TypedGoRoute<MyPageRoute>(
  path: '/MyPage',
)
class MyPageRoute extends GoRouteData {
  const MyPageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const MyPage();
}
