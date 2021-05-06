import 'package:app_of_legends/src/blocs/champions/champions_bloc.dart';
import 'package:app_of_legends/src/widgets/champions_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowListChampionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ChampionsBloc()..add(LoadChampionsEvent()),
        child: BlocBuilder<ChampionsBloc, ChampionsState>(
          builder: (context, state) {
            final bloc = BlocProvider.of<ChampionsBloc>(context);
            return Scaffold(
                appBar: AppBar(
                  title: Text("Campeones", key: Key("app_bar_list_champions")),
                ),
                body: (() {
                  if (state is InitialChampionsState ||
                      state is LoadingChampionsState) {
                    return Center(
                      key: Key("loading_list_champions"),
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is NoDataChampionsState) {
                    return Center(
                      key: Key("no_data_champions"),
                      child: Text("No data"),
                    );
                  }
                  if (state is ReceivedChampionsState) {
                    return showListChamps(bloc, context);
                  }
                  return Container();
                }()));
          },
        ));
  }

  Widget showListChamps(ChampionsBloc bloc, BuildContext context) {
    return GridView.builder(
      key: Key("list_champions"),
      itemCount: bloc.champions?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            (MediaQuery.of(context).orientation == Orientation.portrait)
                ? 4
                : 5,
      ),
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: FutureBuilder(
              future: bloc.getImageUrl(bloc.champions![i].id),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return ChampionsListItem(id: bloc.champions![i].id, name: bloc.champions![i].name, urlImage: snapshot.data!,);
                } else {
                  return Center(
                    key: Key("loading_item_champion_${bloc.champions?[i].id}"),
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        );
      },
    );
  }
}
