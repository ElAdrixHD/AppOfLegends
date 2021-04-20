import 'package:json_annotation/json_annotation.dart';

part 'skin.g.dart';

@JsonSerializable()
class Skin{
  final String id;
  @JsonKey(name: "num")
  final num numero;
  final String name;
  final bool chromas;

  Skin(this.id, this.numero, this.name, this.chromas);

  Map<String, dynamic> toJson() => _$SkinToJson(this);

  factory Skin.fromJson(Map<String, dynamic> json) =>
      _$SkinFromJson(json);
}