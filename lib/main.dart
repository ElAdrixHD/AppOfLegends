import 'package:app_of_legends/src/blocs/champion_detail_page/champion_details_bloc.dart';
import 'package:app_of_legends/src/blocs/champions_page/champions_bloc.dart';
import 'package:app_of_legends/src/pages/champion_details_page.dart';
import 'package:app_of_legends/src/pages/champions_page.dart';
import 'package:app_of_legends/src/pages/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyProviders());
}

class MyProviders extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => ChampionsBloc(),),
          BlocProvider(create: (BuildContext context) => ChampionDetailsBloc(),)
        ],
        child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Of Legends',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.indigo,
      ),
      initialRoute: MenuPage.route,

      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name){
          case MenuPage.route:
            return MaterialPageRoute(builder: (_) => MenuPage());
            break;
          case ChampionsPage.route:
            return MaterialPageRoute(builder: (_) => ChampionsPage());
            break;
          case ChampionDetailPage.route:
            return MaterialPageRoute(builder: (_) => ChampionDetailPage(settings.arguments));
            break;
          default:
            return MaterialPageRoute(builder: (_) => MenuPage());
            break;
        }
      },
    );
  }
}
