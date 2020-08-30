import 'package:app_of_legends/src/blocs/champion_detail_page/champion_details_bloc.dart';
import 'package:app_of_legends/src/models/champions.dart';
import 'package:app_of_legends/src/models/full_champion_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';

class ChampionDetailPage extends StatefulWidget {
  static const route = "/champion-details";
  final BasicDataChampion basicDataChampion;
  ChampionDetailPage(this.basicDataChampion);

  @override
  _ChampionDetailPageState createState() => _ChampionDetailPageState(basicDataChampion);
}

class _ChampionDetailPageState extends State<ChampionDetailPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final BasicDataChampion basicDataChampion;
  _ChampionDetailPageState(this.basicDataChampion);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(basicDataChampion.name),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            _currentPage = index;
          });
          _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.linear);
        },
        currentIndex: _currentPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), title: Text("Info")),
          BottomNavigationBarItem(icon: Icon(Icons.flash_on), title: Text("Habilidades")),
          BottomNavigationBarItem(icon: Icon(Icons.photo_library), title: Text("Aspectos")),
        ],
      ),
      body: BlocConsumer<ChampionDetailsBloc, ChampionDetailsState>(
        listener: (BuildContext context, ChampionDetailsState state) {},
        builder: (BuildContext context, state){
          if(state is ChampionDetailsInitial){
            return Center(child: CircularProgressIndicator());
          }
          if(state is ChampionDetailsLoading){
            return Center(child: CircularProgressIndicator());
          }
          if(state is ChampionDetailsGetted){
            return _showPageView(state.fullInfoChampion);
          }
          if(state is ChampionDetailsNotGetted){
            return Center(child: Text(state.msg),);
          }
          return Container();
        },
      ),
    );
  }

  Widget _infoChampion(FullChampion fullInfoChampion) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: "http://ddragon.leagueoflegends.com/cdn/10.16.1/img/champion/${fullInfoChampion.image.full}",height: 100,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Container(alignment: Alignment.centerLeft, child: Text(fullInfoChampion.name, style: Theme.of(context).textTheme.headline5)),
                      SizedBox(height: 10,),
                      Container(alignment: Alignment.centerLeft, child: Text(fullInfoChampion.title.replaceRange(0, 1, fullInfoChampion.title[0].toUpperCase()), style: Theme.of(context).textTheme.bodyText1)),
                      SizedBox(height: 10,),
                      Container(alignment: Alignment.bottomRight, child: Text(fullInfoChampion.tags.map((e) => "${e.toString().split(".").last} ").join().trim(), style: Theme.of(context).textTheme.caption)),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider(),
          Container(
            child: Text(fullInfoChampion.lore, style: Theme.of(context).textTheme.bodyText2,),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _spellsChampion(FullChampion fullInfoChampion) {
    return Center(child: Text("2"),);
  }

  //Deprecated
  Widget _sskinsChampion(FullChampion fullInfoChampion) {
    return GridView.builder(
        itemCount: fullInfoChampion.skins.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.55),
        itemBuilder: (cxt, i){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                GestureDetector(onTap:(){
                  showGeneralDialog(context: cxt,barrierColor: Colors.black, transitionDuration: Duration(milliseconds: 500), barrierDismissible: false, pageBuilder: (ccc,__,___){
                    return GestureDetector(onTap:(){Navigator.pop(ccc);},child: SizedBox.expand(child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        FadeInImage.memoryNetwork(placeholder: kTransparentImage,image:"http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${fullInfoChampion.id}_${fullInfoChampion.skins[i].num}.jpg",),
                      ],
                    )));
                    //Image.network("http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${fullInfoChampion.id}_${fullInfoChampion.skins[i].num}.jpg", fit: BoxFit.scaleDown,)
                  });
                },child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: "https://ddragon.leagueoflegends.com/cdn/img/champion/loading/${fullInfoChampion.id}_${fullInfoChampion.skins[i].num}.jpg",height: MediaQuery.of(context).size.height*0.71,),
                  ],
                )),
                SizedBox(height: 10.0,),
                Text(fullInfoChampion.skins[i].name, overflow: TextOverflow.ellipsis,),
              ],
            ),
          );
        }
    );
  }

  Widget _skinsChampion(FullChampion fullInfoChampion) {
    return ListView.builder(
      itemCount: fullInfoChampion.skins.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (cxt, i){
        return Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: GestureDetector(onTap:(){
                  showGeneralDialog(context: cxt,barrierColor: Colors.black, transitionDuration: Duration(milliseconds: 500), barrierDismissible: false, pageBuilder: (ccc,__,___){
                    return GestureDetector(onTap:(){Navigator.pop(ccc);},child: SizedBox.expand(child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        FadeInImage.memoryNetwork(placeholder: kTransparentImage,image:"http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${fullInfoChampion.id}_${fullInfoChampion.skins[i].num}.jpg",),
                      ],
                    )));
                    //Image.network("http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${fullInfoChampion.id}_${fullInfoChampion.skins[i].num}.jpg", fit: BoxFit.scaleDown,)
                  });
                },child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: "https://ddragon.leagueoflegends.com/cdn/img/champion/loading/${fullInfoChampion.id}_${fullInfoChampion.skins[i].num}.jpg",),
                  ],
                )),
              ),
              SizedBox(height: 10.0,),
              Text(fullInfoChampion.skins[i].name, overflow: TextOverflow.ellipsis,),
            ],
          ),
        );
      },
    );
  }

  Widget _showPageView(FullChampion fullInfoChampion) {
    return PageView(
      controller: _pageController,
      onPageChanged: (int index){
        setState(() {
          _currentPage = index;
        });
      },
      children: <Widget>[
        _infoChampion(fullInfoChampion),
        _spellsChampion(fullInfoChampion),
        _skinsChampion(fullInfoChampion)
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChampionDetailsBloc>(context).add(LoadChampionInfoEvent(basicDataChampion));
  }
}
