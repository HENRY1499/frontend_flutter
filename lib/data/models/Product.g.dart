// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  pid: int.tryParse(json['id_product'].toString()) ?? 0,
  name: json['name'] as String,
  description: json['description'] as String,
  salesPrice: double.tryParse(json['sales_price'].toString()) ?? 0.0,
  purchasePrice: double.tryParse(json['purchase_price'].toString()) ?? 0.0,
  stock: int.tryParse(json['stock'].toString()) ?? 0,
  category: Category.fromJson(json['category'] as Map<String, dynamic>),
  status: json['status'].toString(),
  createdat: json['createdat'] != null
      ? DateTime.tryParse(json['createdat'])
      : null,
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
