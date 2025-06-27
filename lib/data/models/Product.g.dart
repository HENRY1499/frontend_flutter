// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  pid: (json['id_product'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  salesPrice: (json['sales_price'] as num).toDouble(),
  purchasePrice: (json['purchase_price'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  category: Category.fromJson(json['category'] as Map<String, dynamic>),
  status: (json['status'] as num).toInt(),
  createdat: (json['createdat'] as num).toInt(),
  updatedat: (json['updatedat'] as num).toInt(),
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
  'createdat': instance.createdat,
  'updatedat': instance.updatedat,
};
