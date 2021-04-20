import 'package:json_annotation/json_annotation.dart';

part 'stat.g.dart';

@JsonSerializable()
class Stat{
  final num hp;
  final num hpperlevel;
  final num mp;
  final num mpperlevel;
  final num armor;
  final num movespeed;
  final num spellblock;
  final num spellblockperlevel;
  final num attackrange;
  final num hpregen;
  final num hpregenperlevel;
  final num mpregen;
  final num mpregenperlevel;
  final num crit;
  final num critperlevel;
  final num attackdamage;
  final num attackdamageperlevel;
  final num attackspeedperlevel;
  final num attackspeed;

  Stat(this.hp, this.hpperlevel, this.mp, this.mpperlevel, this.armor, this.movespeed, this.spellblock, this.spellblockperlevel, this.attackrange, this.hpregen, this.hpregenperlevel, this.mpregen, this.mpregenperlevel, this.crit, this.critperlevel, this.attackdamage, this.attackdamageperlevel, this.attackspeedperlevel, this.attackspeed);

  Map<String, dynamic> toJson() => _$StatToJson(this);

  factory Stat.fromJson(Map<String, dynamic> json) =>
      _$StatFromJson(json);
}