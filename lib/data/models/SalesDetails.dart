import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
import 'package:prueba_tecnica/data/models/Product.dart';

part 'SalesDetails.g.dart';

@JsonSerializable()
class Salesdetails {
  final Product product;
  final double quantity;
  @JsonKey(name: 'sales_price')
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
}
