// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_tip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelTip _$LevelTipFromJson(Map<String, dynamic> json) {
  return LevelTip(
    (json['label'] as Map<String, dynamic>).map(
      (k, e) =>
          MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
    ),
    (json['effect'] as Map<String, dynamic>).map(
      (k, e) =>
          MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
    ),
  );
}

Map<String, dynamic> _$LevelTipToJson(LevelTip instance) => <String, dynamic>{
      'label': instance.label,
      'effect': instance.effect,
    };
