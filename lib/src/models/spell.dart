import 'package:app_of_legends/src/models/image.dart';
import 'package:json_annotation/json_annotation.dart';

import 'level_tip.dart';

part 'spell.g.dart';

@JsonSerializable()
class Spell{
  final String id;
  final String name;
  final String description;
  final String tooltip;
  final LevelTip leveltip;
  final int maxrank;
  final List<num> cooldown;
  @JsonKey(name: "cooldownBurn")
  final String cooldownBurn;
  final List<num> cost;
  @JsonKey(name: "costBurn")
  final String costBurn;
  final List<List<num>?> effect;
  @JsonKey(name: "effectBurn")
  final List<String?> effectBurn;
  final String maxammo;
  final List<num> range;
  @JsonKey(name: "rangeBurn")
  final String rangeBurn;
  final Image image;
  final String resource;

  Spell(this.id, this.name, this.description, this.tooltip, this.leveltip, this.maxrank, this.cooldown, this.cooldownBurn, this.cost, this.costBurn, this.effect, this.effectBurn, this.maxammo, this.range, this.rangeBurn, this.image, this.resource);

  Map<String, dynamic> toJson() => _$SpellToJson(this);

  factory Spell.fromJson(Map<String, dynamic> json) =>
      _$SpellFromJson(json);
}