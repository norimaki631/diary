import 'package:diary/my_page/my_page.dart';
import 'package:diary/sign_in/sign_in_page.dart';
import 'package:diary/time_line/time_line_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  return GoRouter(
    initialLocation: const SignInRoute().location,
    navigatorKey: routerKey,
    debugLogDiagnostics: kDebugMode,
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

@TypedGoRoute<TimeLineRoute>(
  path: '/TimeLine',
)
class TimeLineRoute extends GoRouteData {
  const TimeLineRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TimeLinePage();
}

@TypedGoRoute<MyPageRoute>(
  path: '/MyPage',
)
class MyPageRoute extends GoRouteData {
  const MyPageRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) => const MyPage();
}
