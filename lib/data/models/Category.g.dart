// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  cid: (json['id_categories'] as num).toInt(),
  name: json['name'] as String,
  image: json['image'] as String,
  status: (json['status'] as num).toInt(),
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id_categories': instance.cid,
  'name': instance.name,
  'image': instance.image,
  'status': instance.status,
};
