part of 'champions_bloc.dart';

@immutable
abstract class ChampionsEvent {}

class LoadChampionsEvent extends ChampionsEvent {}

class LoadChampionDetailEvent extends ChampionsEvent {
  final String id;
  LoadChampionDetailEvent(this.id);
}
