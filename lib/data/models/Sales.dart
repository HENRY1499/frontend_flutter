import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

part 'Sales.g.dart';

@JsonSerializable()
class Sales {
  @JsonKey(name: 'id_sale')
  final int sid;
  final double total;
  final DateTime? createdat;

  Sales({required this.sid, required this.total, required this.createdat});

  factory Sales.fromJson(Map<String, dynamic> json) => _$SalesFromJson(json);

  Map<String, dynamic> toJson() => _$SalesToJson(this);
}
