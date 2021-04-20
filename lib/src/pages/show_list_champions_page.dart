import 'package:app_of_legends/src/blocs/champions/champions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowListChampionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChampionsBloc()..add(LoadChampionsEvent()),
      child: BlocBuilder<ChampionsBloc, ChampionsState>(
        builder: (context, state) {
          print(state.toString());
          final bloc = BlocProvider.of<ChampionsBloc>(context, listen: false);
          return Scaffold(
              appBar: AppBar(title: Text("Campeones"),),
              body: (() {
                if (state is InitialChampionsState ||
                    state is LoadingChampionsState) {
                  return Center(child: CircularProgressIndicator(),);
                }
                if (state is NoDataChampionsState) {
                  return Center(child: Text("No Data"),);
                }
                if (state is ReceivedChampionsState) {
                  return showListChamps(bloc, context);
                }
                return Container();
              }())
          );
        },
      )
    );
  }

  Widget showListChamps(ChampionsBloc bloc, BuildContext context) {
    return GridView.builder(
      itemCount: bloc.champions?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (MediaQuery.of(context).orientation == Orientation.portrait)? 4 : 5,),
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: FutureBuilder(
            future: bloc.getImageUrl(bloc.champions![i].id),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if(snapshot.hasData){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: NetworkImage(snapshot.data!,),
                                fit: BoxFit.scaleDown
                            )
                        ),
                      ),
                    ),
                    Text(bloc.champions?[i].name ?? '', overflow: TextOverflow.ellipsis,),
                  ],
                );
              }else{
                return Container(
                  height: bloc.champions![i].image.h.toDouble(),
                  width: bloc.champions![i].image.w.toDouble(),
                  child: CircularProgressIndicator(),
                );
              }
            }
          ),
        );
      },
    );
  }
}
