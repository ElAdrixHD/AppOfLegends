// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Skin _$SkinFromJson(Map<String, dynamic> json) {
  return Skin(
    json['id'] as String,
    json['num'] as num,
    json['name'] as String,
    json['chromas'] as bool,
  );
}

Map<String, dynamic> _$SkinToJson(Skin instance) => <String, dynamic>{
      'id': instance.id,
      'num': instance.numero,
      'name': instance.name,
      'chromas': instance.chromas,
    };
