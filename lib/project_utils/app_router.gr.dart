// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const MainScreen()),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainScreenRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [MainScreen]
class MainScreenRoute extends PageRouteInfo<void> {
  const MainScreenRoute()
      : super(
          MainScreenRoute.name,
          path: '/',
        );

  static const String name = 'MainScreenRoute';
}
