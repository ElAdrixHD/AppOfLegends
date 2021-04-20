import 'package:json_annotation/json_annotation.dart';

part 'level_tip.g.dart';

@JsonSerializable()
class LevelTip{
  final Map<String, List<String>> label;
  final Map<String, List<String>> effect;


  LevelTip(this.label, this.effect);

  Map<String, dynamic> toJson() => _$LevelTipToJson(this);

  factory LevelTip.fromJson(Map<String, dynamic> json) =>
      _$LevelTipFromJson(json);
}