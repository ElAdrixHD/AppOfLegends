import 'dart:convert';

import 'package:app_of_legends/src/models/champions.dart';

FullInfoChampion fullInfoChampionFromJson(String str, String champ) => FullInfoChampion.fromJson(json.decode(str), champ);

class FullInfoChampion {
  FullInfoChampion({
    this.type,
    this.format,
    this.data,
  });

  String type;
  String format;
  Data data;

  factory FullInfoChampion.fromJson(Map<String, dynamic> json, String champ) => FullInfoChampion(
    type: json["type"],
    format: json["format"],
    data: Data.fromJson(json["data"], champ),
  );

}

class Data {
  Data({
    this.full_champion,
  });

  FullChampion full_champion;

  factory Data.fromJson(Map<String, dynamic> json, String champ) => Data(
    full_champion: FullChampion.fromJson(json[champ]),
  );
}

class FullChampion {
  FullChampion({
    this.id,
    this.key,
    this.name,
    this.title,
    this.image,
    this.skins,
    this.lore,
    this.blurb,
    this.allytips,
    this.enemytips,
    this.tags,
    this.partype,
    this.info,
    this.stats,
    this.spells,
    this.passive,
    this.recommended,
  });

  String id;
  String key;
  String name;
  String title;
  ImageChampion image;
  List<Skin> skins;
  String lore;
  String blurb;
  List<String> allytips;
  List<String> enemytips;
  List<String> tags;
  String partype;
  Info info;
  Map<String, double> stats;
  List<Spell> spells;
  Passive passive;
  List<Recommended> recommended;

  factory FullChampion.fromJson(Map<String, dynamic> json) => FullChampion(
    id: json["id"],
    key: json["key"],
    name: json["name"],
    title: json["title"],
    image: ImageChampion.fromJson(json["image"]),
    skins: List<Skin>.from(json["skins"].map((x) => Skin.fromJson(x))),
    lore: json["lore"],
    blurb: json["blurb"],
    allytips: List<String>.from(json["allytips"].map((x) => x)),
    enemytips: List<String>.from(json["enemytips"].map((x) => x)),
    tags: List<String>.from(json["tags"].map((x) => x)),
    partype: json["partype"],
    info: Info.fromJson(json["info"]),
    stats: Map.from(json["stats"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    spells: List<Spell>.from(json["spells"].map((x) => Spell.fromJson(x))),
    passive: Passive.fromJson(json["passive"]),
    recommended: List<Recommended>.from(json["recommended"].map((x) => Recommended.fromJson(x))),
  );
}

class Passive {
  Passive({
    this.name,
    this.description,
    this.image,
  });

  String name;
  String description;
  ImageChampion image;

  factory Passive.fromJson(Map<String, dynamic> json) => Passive(
    name: json["name"],
    description: json["description"],
    image: ImageChampion.fromJson(json["image"]),
  );

}

class Recommended {
  Recommended({
    this.champion,
    this.title,
    this.map,
    this.mode,
    this.type,
    this.customTag,
    this.sortrank,
    this.extensionPage,
    this.useObviousCheckmark,
    this.customPanel,
    this.blocks,
  });

  String champion;
  String title;
  String map;
  String mode;
  String type;
  String customTag;
  int sortrank;
  bool extensionPage;
  bool useObviousCheckmark;
  dynamic customPanel;
  List<Block> blocks;

  factory Recommended.fromJson(Map<String, dynamic> json) => Recommended(
    champion: json["champion"],
    title: json["title"],
    map: json["map"],
    mode: json["mode"],
    type: json["type"],
    customTag: json["customTag"],
    sortrank: json["sortrank"] == null ? null : json["sortrank"],
    extensionPage: json["extensionPage"],
    useObviousCheckmark: json["useObviousCheckmark"] == null ? null : json["useObviousCheckmark"],
    customPanel: json["customPanel"],
    blocks: List<Block>.from(json["blocks"].map((x) => Block.fromJson(x))),
  );

}

class Block {
  Block({
    this.type,
    this.recMath,
    this.recSteps,
    this.minSummonerLevel,
    this.maxSummonerLevel,
    this.showIfSummonerSpell,
    this.hideIfSummonerSpell,
    this.appendAfterSection,
    this.visibleWithAllOf,
    this.hiddenWithAnyOf,
    this.items,
  });

  String type;
  bool recMath;
  bool recSteps;
  int minSummonerLevel;
  int maxSummonerLevel;
  IfSummonerSpell showIfSummonerSpell;
  IfSummonerSpell hideIfSummonerSpell;
  String appendAfterSection;
  List<String> visibleWithAllOf;
  List<String> hiddenWithAnyOf;
  List<Item> items;

  factory Block.fromJson(Map<String, dynamic> json) => Block(
    type: json["type"],
    recMath: json["recMath"],
    recSteps: json["recSteps"],
    minSummonerLevel: json["minSummonerLevel"],
    maxSummonerLevel: json["maxSummonerLevel"],
    showIfSummonerSpell: ifSummonerSpellValues.map[json["showIfSummonerSpell"]],
    hideIfSummonerSpell: ifSummonerSpellValues.map[json["hideIfSummonerSpell"]],
    appendAfterSection: json["appendAfterSection"] == null ? null : json["appendAfterSection"],
    visibleWithAllOf: json["visibleWithAllOf"] == null ? null : List<String>.from(json["visibleWithAllOf"].map((x) => x)),
    hiddenWithAnyOf: json["hiddenWithAnyOf"] == null ? null : List<String>.from(json["hiddenWithAnyOf"].map((x) => x)),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

}

enum IfSummonerSpell { EMPTY, SUMMONER_SMITE }

final ifSummonerSpellValues = EnumValues({
  "": IfSummonerSpell.EMPTY,
  "SummonerSmite": IfSummonerSpell.SUMMONER_SMITE
});

class Item {
  Item({
    this.id,
    this.count,
    this.hideCount,
  });

  String id;
  int count;
  bool hideCount;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    count: json["count"],
    hideCount: json["hideCount"],
  );

}

class Skin {
  Skin({
    this.id,
    this.num,
    this.name,
    this.chromas,
  });

  String id;
  int num;
  String name;
  bool chromas;

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
    id: json["id"],
    num: json["num"],
    name: json["name"],
    chromas: json["chromas"],
  );
}

class Spell {
  Spell({
    this.id,
    this.name,
    this.description,
    this.tooltip,
    this.maxrank,
    this.cooldown,
    this.cooldownBurn,
    this.cost,
    this.costBurn,
    this.datavalues,
    this.effect,
    this.effectBurn,
    this.vars,
    this.costType,
    this.maxammo,
    this.range,
    this.rangeBurn,
    this.image,
    this.resource,
  });

  String id;
  String name;
  String description;
  String tooltip;
  int maxrank;
  List<dynamic> cooldown;
  String cooldownBurn;
  List<dynamic> cost;
  String costBurn;
  Datavalues datavalues;
  List<List<dynamic>> effect;
  List<String> effectBurn;
  List<dynamic> vars;
  String costType;
  String maxammo;
  List<int> range;
  String rangeBurn;
  ImageChampion image;
  String resource;

  factory Spell.fromJson(Map<String, dynamic> json) => Spell(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    tooltip: json["tooltip"],
    maxrank: json["maxrank"],
    cooldown: List<dynamic>.from(json["cooldown"].map((x) => x)),
    cooldownBurn: json["cooldownBurn"],
    cost: List<dynamic>.from(json["cost"].map((x) => x)),
    costBurn: json["costBurn"],
    datavalues: Datavalues.fromJson(json["datavalues"]),
    effect: List<List<dynamic>>.from(json["effect"].map((x) => x == null ? null : List<dynamic>.from(x.map((x) => x)))),
    effectBurn: List<String>.from(json["effectBurn"].map((x) => x == null ? null : x)),
    vars: List<dynamic>.from(json["vars"].map((x) => x)),
    costType: json["costType"],
    maxammo: json["maxammo"],
    range: List<int>.from(json["range"].map((x) => x)),
    rangeBurn: json["rangeBurn"],
    image: ImageChampion.fromJson(json["image"]),
    resource: json["resource"],
  );

}

class Datavalues {
  Datavalues();

  factory Datavalues.fromJson(Map<String, dynamic> json) => Datavalues(
  );

  Map<String, dynamic> toJson() => {
  };
}

List<String> versionFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));