import 'dart:async';
import 'dart:math';

import 'package:app_of_legends/src/models/champions.dart';
import 'package:app_of_legends/src/models/full_champion_info.dart';
import 'package:app_of_legends/src/providers/champions_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'champion_details_event.dart';
part 'champion_details_state.dart';

class ChampionDetailsBloc extends Bloc<ChampionDetailsEvent, ChampionDetailsState> {
  ChampionDetailsBloc() : super(ChampionDetailsInitial());

  ChampionsProvider provider = ChampionsProvider();

  @override
  Stream<ChampionDetailsState> mapEventToState(ChampionDetailsEvent event,) async* {
    if(event is LoadChampionInfoEvent){
      yield ChampionDetailsLoading();
      final lastVersion = await provider.getLastVersion();
      FullInfoChampion fullInfoChampion = await provider.getFullInfo(lastVersion, event.basicDataChampion.id);
      if(fullInfoChampion == null){
        yield ChampionDetailsNotGetted("No hay datos");
      }else{
        yield ChampionDetailsGetted(fullInfoChampion.data.full_champion);
      }
    }
  }
}
