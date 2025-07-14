// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  cid: (json['id_categories'] as num?)?.toInt(),
  name: json['name'] as String,
  rol: (json['rol'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  createdat:
      json['createdat'] == null
          ? null
          : DateTime.parse(json['createdat'] as String),
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id_categories': instance.cid,
  'name': instance.name,
  'rol': instance.rol,
  'status': instance.status,
  'createdat': instance.createdat?.toIso8601String(),
};
