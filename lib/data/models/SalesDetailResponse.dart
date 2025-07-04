import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
import 'package:prueba_tecnica/data/models/Product.dart';

part 'SalesDetailResponse.g.dart';

@JsonSerializable()
class SalesDetailResponse {
  final int quantity;

  @JsonKey(
    name: 'sales_price',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  final double salesPrice;
  @JsonKey(name: 'pay_method')
  final String payMethod;
  final DateTime createdat;

  final Product product; // objeto completo

  SalesDetailResponse({
    required this.quantity,
    required this.salesPrice,
    required this.payMethod,
    required this.createdat,
    required this.product,
  });

  factory SalesDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$SalesDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SalesDetailResponseToJson(this);
  static double _doubleFromJson(dynamic value) =>
      double.tryParse(value.toString()) ?? 0.0;

  static dynamic _doubleToJson(double value) => value;
}
