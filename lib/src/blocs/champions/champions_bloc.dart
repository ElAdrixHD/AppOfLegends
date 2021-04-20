import 'dart:async';
import 'package:app_of_legends/src/models/champion.dart';
import 'package:app_of_legends/src/providers/champions_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'champions_event.dart';

part 'champions_state.dart';

class ChampionsBloc extends Bloc<ChampionsEvent, ChampionsState> {
  ChampionsBloc() : super(InitialChampionsState());

  ChampionsProvider _provider = ChampionsProvider();

  List<Champion>? champions;

  @override
  Stream<ChampionsState> mapEventToState(ChampionsEvent event) async* {
    if(event is LoadChampionsEvent)
      yield* loadAllChampions();
  }

  Stream<ChampionsState> loadAllChampions() async*{
    yield LoadingChampionsState();
    champions = await _provider.getChampions();

    if(champions == null){
      yield NoDataChampionsState();
    }else{
      yield ReceivedChampionsState();
    }
  }

  Future<String> getImageUrl(String id) async{
    return await _provider.getImageURL(id);
  }
}
