import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image{
  final String full;
  final String sprite;
  final String group;
  final num x;
  final num y;
  final num w;
  final num h;

  Image(this.full, this.sprite, this.group, this.x, this.y, this.w, this.h);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);
}