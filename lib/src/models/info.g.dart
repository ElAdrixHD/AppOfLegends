// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) {
  return Info(
    json['attack'] as num,
    json['defense'] as num,
    json['magic'] as num,
    json['difficulty'] as num,
  );
}

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'attack': instance.attack,
      'defense': instance.defense,
      'magic': instance.magic,
      'difficulty': instance.difficulty,
    };
