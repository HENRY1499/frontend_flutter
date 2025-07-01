// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  pid: (json['id_product'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  salesPrice: json['sales_price'] as String,
  purchasePrice: json['purchase_price'] as String,
  stock: (json['stock'] as num).toInt(),
  category: Category.fromJson(json['category'] as Map<String, dynamic>),
  status: json['status'] as String,
  createdat:
      json['createdat'] == null
          ? null
          : DateTime.parse(json['createdat'] as String),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id_product': instance.pid,
  'name': instance.name,
  'description': instance.description,
  'sales_price': instance.salesPrice,
  'purchase_price': instance.purchasePrice,
  'stock': instance.stock,
  'category': instance.category,
  'status': instance.status,
  'createdat': instance.createdat?.toIso8601String(),
};
