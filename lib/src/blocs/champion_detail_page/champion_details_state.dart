part of 'champion_details_bloc.dart';

abstract class ChampionDetailsState extends Equatable {
  const ChampionDetailsState();
  @override
  List<Object> get props => [];
}

class ChampionDetailsInitial extends ChampionDetailsState {
}

class ChampionDetailsLoading extends ChampionDetailsState {
}

class ChampionDetailsGetted extends ChampionDetailsState {
  final FullChampion fullInfoChampion;
  ChampionDetailsGetted(this.fullInfoChampion);
}

class ChampionDetailsNotGetted extends ChampionDetailsState {
  final String msg;
  ChampionDetailsNotGetted(this.msg);
}
