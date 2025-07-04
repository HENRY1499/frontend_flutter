import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:prueba_tecnica/data/models/Category.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: 'id_product')
  final int? pid;
  final String name;
  final String? description;
  @JsonKey(name: 'sales_price')
  final String? salesPrice;
  @JsonKey(name: 'purchase_price')
  final String? purchasePrice;
  final int? stock;
  final Category category;
  final String? status;
  final DateTime? createdat;
  Product({
    required this.pid,
    required this.name,
    required this.description,
    required this.salesPrice,
    required this.purchasePrice,
    required this.stock,
    required this.category,
    required this.status,
    required this.createdat,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
