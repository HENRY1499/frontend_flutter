import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

part 'SalesDetails.g.dart';

@JsonSerializable()
class Salesdetails {
  @JsonKey(name: 'id_product')
  final int product;
  final int quantity;
  @JsonKey(
    name: 'sales_price',
    fromJson: _doubleFromJson,
    toJson: _doubleToJson,
  )
  final double salesPrice;
  @JsonKey(name: 'pay_method')
  final String payMethod;
  final DateTime? createdat;

  Salesdetails({
    required this.product,
    required this.quantity,
    required this.salesPrice,
    required this.payMethod,
    required this.createdat,
  });
  factory Salesdetails.fromJson(Map<String, dynamic> json) =>
      _$SalesdetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SalesdetailsToJson(this);
  static double _doubleFromJson(dynamic value) =>
      double.tryParse(value.toString()) ?? 0.0;

  static dynamic _doubleToJson(double value) => value;
}
