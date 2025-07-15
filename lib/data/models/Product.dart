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
  final int? users;
  final Category category;
  final String? status;
  final DateTime? createdat;
  Product({
    this.pid,
    required this.name,
    this.description,
    this.salesPrice,
    this.purchasePrice,
    this.stock,
    this.users,
    required this.category,
    this.status,
    this.createdat,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
