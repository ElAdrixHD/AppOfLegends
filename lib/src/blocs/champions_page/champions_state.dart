part of 'champions_bloc.dart';

abstract class ChampionsState extends Equatable {
  const ChampionsState();
  @override
  List<Object> get props => [];
}

class ChampionsInitial extends ChampionsState {
}

class ChampionsLoading extends ChampionsState {
}

class ChampionsGetted extends ChampionsState {
  final Champions champions;
  ChampionsGetted(this.champions);
}

class ChampionsNotGetted extends ChampionsState {
  final String message;
  ChampionsNotGetted(this.message);
}
