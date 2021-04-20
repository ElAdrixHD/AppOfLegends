// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spell _$SpellFromJson(Map<String, dynamic> json) {
  return Spell(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['tooltip'] as String,
    LevelTip.fromJson(json['leveltip'] as Map<String, dynamic>),
    json['maxrank'] as int,
    (json['cooldown'] as List<dynamic>).map((e) => e as num).toList(),
    json['cooldownBurn'] as String,
    (json['cost'] as List<dynamic>).map((e) => e as num).toList(),
    json['costBurn'] as String,
    (json['effect'] as List<dynamic>)
        .map((e) => (e as List<dynamic>?)?.map((e) => e as num).toList())
        .toList(),
    (json['effectBurn'] as List<dynamic>).map((e) => e as String?).toList(),
    json['maxammo'] as String,
    (json['range'] as List<dynamic>).map((e) => e as num).toList(),
    json['rangeBurn'] as String,
    Image.fromJson(json['image'] as Map<String, dynamic>),
    json['resource'] as String,
  );
}

Map<String, dynamic> _$SpellToJson(Spell instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'tooltip': instance.tooltip,
      'leveltip': instance.leveltip,
      'maxrank': instance.maxrank,
      'cooldown': instance.cooldown,
      'cooldownBurn': instance.cooldownBurn,
      'cost': instance.cost,
      'costBurn': instance.costBurn,
      'effect': instance.effect,
      'effectBurn': instance.effectBurn,
      'maxammo': instance.maxammo,
      'range': instance.range,
      'rangeBurn': instance.rangeBurn,
      'image': instance.image,
      'resource': instance.resource,
    };
