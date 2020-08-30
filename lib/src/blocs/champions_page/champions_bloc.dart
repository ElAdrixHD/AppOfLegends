import 'dart:async';

import 'package:app_of_legends/src/models/champions.dart';
import 'package:app_of_legends/src/providers/champions_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:provider/provider.dart';

part 'champions_event.dart';
part 'champions_state.dart';

class ChampionsBloc extends Bloc<ChampionsEvent, ChampionsState> {
  ChampionsBloc() : super(ChampionsInitial());

  ChampionsProvider provider = ChampionsProvider();

  @override
  Stream<ChampionsState> mapEventToState(ChampionsEvent event) async* {
    if(event is LoadChampionsEvent){
      yield ChampionsLoading();
      final lastVersion = await provider.getLastVersion();
      Champions champions = await provider.getChampions(lastVersion);
      if(champions == null){
        yield ChampionsNotGetted("No hay campeones");
      }else{
        yield ChampionsGetted(champions);
      }
    }
  }
}
