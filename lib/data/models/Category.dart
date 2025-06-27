import 'package:json_annotation/json_annotation.dart';

part 'Category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: 'id_categories')
  final int cid;
  final String name;
  final String image;
  final int status;

  Category({
    required this.cid,
    required this.name,
    required this.image,
    required this.status,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
