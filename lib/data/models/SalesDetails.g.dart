// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SalesDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salesdetails _$SalesdetailsFromJson(Map<String, dynamic> json) => Salesdetails(
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toDouble(),
  salesPrice: (json['sales_price'] as num).toDouble(),
  payMethod: json['pay_method'] as String,
  createdat:
      json['createdat'] == null
          ? null
          : DateTime.parse(json['createdat'] as String),
);

Map<String, dynamic> _$SalesdetailsToJson(Salesdetails instance) =>
    <String, dynamic>{
      'product': instance.product,
      'quantity': instance.quantity,
      'sales_price': instance.salesPrice,
      'pay_method': instance.payMethod,
      'createdat': instance.createdat?.toIso8601String(),
    };
