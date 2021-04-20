// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;

import '../pages/show_list_champions_page.dart' as _i2;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    ShowListChampionsRoute.name: (entry) {
      return _i1.MaterialPageX(
          entry: entry, child: _i2.ShowListChampionsPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes =>
      [_i1.RouteConfig(ShowListChampionsRoute.name, path: '/')];
}

class ShowListChampionsRoute extends _i1.PageRouteInfo {
  const ShowListChampionsRoute() : super(name, path: '/');

  static const String name = 'ShowListChampionsRoute';
}
