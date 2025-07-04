import 'package:json_annotation/json_annotation.dart';
import 'product.dart'; // tu modelo anidado

part 'sales_detail_response.g.dart';

@JsonSerializable()
class SalesDetailResponse {
  final int quantity;

  @JsonKey(name: 'sales_price')
  final double salesPrice;

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
}
