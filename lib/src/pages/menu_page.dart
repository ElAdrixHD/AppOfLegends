import 'package:app_of_legends/src/pages/champions_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  static const route = "/menu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menú Principal"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(title: Text("Campeones"), onTap: () => _champPage(context),),
          ListTile(title: Text("Objetos"),),
          ListTile(title: Text("Runas"),),
        ],
      )
    );
  }

  void _champPage(BuildContext context) {
    Navigator.pushNamed(context, ChampionsPage.route);
  }
}
