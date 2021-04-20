// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Champion _$ChampionFromJson(Map<String, dynamic> json) {
  return Champion(
    json['id'] as String,
    json['version'] as String,
    json['key'] as String,
    json['name'] as String,
    json['title'] as String,
    json['blurb'] as String,
    Info.fromJson(json['info'] as Map<String, dynamic>),
    Image.fromJson(json['image'] as Map<String, dynamic>),
    (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    json['partype'] as String,
    Stat.fromJson(json['stats'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChampionToJson(Champion instance) => <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'key': instance.key,
      'name': instance.name,
      'title': instance.title,
      'blurb': instance.blurb,
      'info': instance.info,
      'image': instance.image,
      'tags': instance.tags,
      'partype': instance.partype,
      'stats': instance.stats,
    };
