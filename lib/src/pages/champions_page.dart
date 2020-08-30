import 'dart:math';

import 'package:app_of_legends/src/blocs/champions_page/champions_bloc.dart';
import 'package:app_of_legends/src/models/champions.dart';
import 'package:app_of_legends/src/pages/champion_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class ChampionsPage extends StatefulWidget {
  static const route = "/champions";

  @override
  _ChampionsPageState createState() => _ChampionsPageState();
}

class _ChampionsPageState extends State<ChampionsPage> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "";


  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChampionsBloc>(context).add(LoadChampionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching ? IconButton(icon: const Icon(Icons.clear), onPressed: () => Navigator.pop(context),) : null,
        title: _isSearching ? _buildSearchField() : Text("Campeones"),
        actions: _buildActions(),
      ),
      body: BlocConsumer<ChampionsBloc, ChampionsState>(
        listener: (BuildContext context, ChampionsState state) {},
        builder: (BuildContext context, state){
          if(state is ChampionsInitial){
          }
          if(state is ChampionsLoading){
            return Center(child: CircularProgressIndicator());
          }
          if(state is ChampionsGetted){
            return _showGridChampions(state.champions);
          }
          if(state is ChampionsNotGetted){
            return Center(child: Text(state.message),);
          }
          return Container();
        },
      ),
    );
  }

  Widget _showListChampions(Champions champions) {
    final _list = champions.data.values.toList();
    return SafeArea(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index){
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(_list[index].name),
                subtitle: Text(_list[index].tags.map((e) => "${e.toString().split(".").last} ").join().trim()),
                leading: Image.network("http://ddragon.leagueoflegends.com/cdn/10.16.1/img/champion/${_list[index].image.full}"),
                onTap: () {},
              ),
              Divider(),
            ],
          );
        },
      ),
    );
    /*return ListView(
      children: champions.data.entries.map((e) => ListTile(title: Text(e.key),)).toList(),
    );*/
  }
  
  Widget _showGridChampions(Champions champions){
    final _list = champions.data.values.where((element) => element.name.toLowerCase().contains(searchQuery)).toList();
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 12.0),
        itemCount: _list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait)?4:7, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0,),
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, ChampionDetailPage.route, arguments: _list[index]);
            },
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: "http://ddragon.leagueoflegends.com/cdn/10.16.1/img/champion/${_list[index].image.full}", height: 80,),
                  ],
                ),
                Text(_list[index].name,overflow: TextOverflow.ellipsis),
              ],
            ),
          );
        });
  }


  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Buscar campeón...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.delete_forever),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery.toLowerCase();
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }
}
