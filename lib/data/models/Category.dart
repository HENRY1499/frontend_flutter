import 'package:json_annotation/json_annotation.dart';

part 'Category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: 'id_categories')
  final int? cid;
  final String name;
  final String? image;
  final int? status;
  final DateTime? createdat;

  Category({
    this.cid,
    required this.name,
    this.image,
    this.status,
    this.createdat,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
