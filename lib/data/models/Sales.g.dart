// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sales.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sales _$SalesFromJson(Map<String, dynamic> json) => Sales(
  sid: (json['id_sale'] as num).toInt(),
  total: (json['total'] as num).toDouble(),
  createdat:
      json['createdat'] == null
          ? null
          : DateTime.parse(json['createdat'] as String),
);

Map<String, dynamic> _$SalesToJson(Sales instance) => <String, dynamic>{
  'id_sale': instance.sid,
  'total': instance.total,
  'createdat': instance.createdat?.toIso8601String(),
};
