import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:update_arch/screens/main_screen/main_screen.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(page: MainScreen, initial: true),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter{}