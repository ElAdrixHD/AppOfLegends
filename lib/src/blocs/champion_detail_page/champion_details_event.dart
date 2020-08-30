part of 'champion_details_bloc.dart';

abstract class ChampionDetailsEvent extends Equatable {
  const ChampionDetailsEvent();
  @override
  List<Object> get props => [];
}

class LoadChampionInfoEvent extends ChampionDetailsEvent{
  final BasicDataChampion basicDataChampion;

  LoadChampionInfoEvent(this.basicDataChampion);
}
