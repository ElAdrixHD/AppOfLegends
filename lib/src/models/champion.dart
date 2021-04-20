import 'package:json_annotation/json_annotation.dart';

import 'image.dart';
import 'info.dart';
import 'skin.dart';
import 'spell.dart';
import 'stat.dart';

part 'champion.g.dart';

@JsonSerializable()
class Champion{
  final String id;
  final String version;
  final String key;
  final String name;
  final String title;
  final String blurb;
  final Info info;
  final Image image;
  final List<String> tags;
  final String partype;
  final Stat stats;
  final List<Skin>? skins;
  final String? lore;
  final List<String>? allytips;
  final List<String>? enemytips;
  final List<Spell> spells;


  Champion(this.id, this.version, this.key, this.name, this.title, this.blurb, this.info, this.image, this.tags, this.partype, this.stats, this.skins, this.lore, this.allytips, this.enemytips, this.spells);



  Map<String, dynamic> toJson() => _$ChampionToJson(this);

  factory Champion.fromJson(Map<String, dynamic> json) =>
      _$ChampionFromJson(json);
}