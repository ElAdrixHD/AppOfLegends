part of 'champions_bloc.dart';

@immutable
abstract class ChampionsState extends Equatable{
  @override
  List<Object> get props => [];
}

class InitialChampionsState extends ChampionsState {
}

class LoadingChampionsState extends ChampionsState {
}

class ReceivedChampionsState extends ChampionsState {
}

class NoDataChampionsState extends ChampionsState {
}