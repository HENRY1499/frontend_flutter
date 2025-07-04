// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SalesDetailResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesDetailResponse _$SalesDetailResponseFromJson(Map<String, dynamic> json) =>
    SalesDetailResponse(
      quantity: (json['quantity'] as num).toInt(),
      salesPrice: SalesDetailResponse._doubleFromJson(json['sales_price']),
      payMethod: json['pay_method'] as String,
      createdat: DateTime.parse(json['createdat'] as String),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalesDetailResponseToJson(
  SalesDetailResponse instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'sales_price': SalesDetailResponse._doubleToJson(instance.salesPrice),
  'pay_method': instance.payMethod,
  'createdat': instance.createdat.toIso8601String(),
  'product': instance.product,
};
