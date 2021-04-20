import 'package:app_of_legends/src/pages/show_list_champions_page.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: ShowListChampionsPage, initial: true),
  ],
)
class $AppRouter {}