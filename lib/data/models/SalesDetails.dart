import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';
import 'package:prueba_tecnica/data/models/Product.dart';
import 'package:prueba_tecnica/data/models/Sales.dart';

part 'Product.g.dart';

@JsonSerializable()
class Salesdetails {
  @JsonKey(name: 'id_detail')
  final int deid;
  final Product product;
  final Sales sales;
  final double quantity;
  final double subtotal;
  @JsonKey(name: 'sales_price')
  final double salesPrice;
  @JsonKey(name: 'pay_method')
  final String payMethod;

  Salesdetails({
    required this.deid,
    required this.product,
    required this.quantity,
    required this.sales,
    required this.subtotal,
    required this.salesPrice,
    required this.payMethod,
  });
}
