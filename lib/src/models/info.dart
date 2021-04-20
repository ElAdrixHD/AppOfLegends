import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable()
class Info{
  final num attack;
  final num defense;
  final num magic;
  final num difficulty;

  Info(this.attack, this.defense, this.magic, this.difficulty);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  factory Info.fromJson(Map<String, dynamic> json) =>
      _$InfoFromJson(json);

}