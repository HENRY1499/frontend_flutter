// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SalesDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salesdetails _$SalesdetailsFromJson(Map<String, dynamic> json) => Salesdetails(
  deid: (json['id_detail'] as num).toInt(),
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toDouble(),
  sales: Sales.fromJson(json['sales'] as Map<String, dynamic>),
  subtotal: (json['subtotal'] as num).toDouble(),
  salesPrice: (json['sales_price'] as num).toDouble(),
  payMethod: json['pay_method'] as String,
  createdat:
      json['createdat'] == null
          ? null
          : DateTime.parse(json['createdat'] as String),
);

Map<String, dynamic> _$SalesdetailsToJson(Salesdetails instance) =>
    <String, dynamic>{
      'id_detail': instance.deid,
      'product': instance.product,
      'sales': instance.sales,
      'quantity': instance.quantity,
      'subtotal': instance.subtotal,
      'sales_price': instance.salesPrice,
      'pay_method': instance.payMethod,
      'createdat': instance.createdat?.toIso8601String(),
    };
