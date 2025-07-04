// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SalesDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salesdetails _$SalesdetailsFromJson(Map<String, dynamic> json) => Salesdetails(
  product: (json['id_product'] as num).toInt(),
  quantity: (json['quantity'] as num).toInt(),
  salesPrice: Salesdetails._doubleFromJson(json['sales_price']),
  payMethod: json['pay_method'] as String,
  createdat:
      json['createdat'] == null
          ? null
          : DateTime.parse(json['createdat'] as String),
);

Map<String, dynamic> _$SalesdetailsToJson(Salesdetails instance) =>
    <String, dynamic>{
      'id_product': instance.product,
      'quantity': instance.quantity,
      'sales_price': Salesdetails._doubleToJson(instance.salesPrice),
      'pay_method': instance.payMethod,
      'createdat': instance.createdat?.toIso8601String(),
    };
