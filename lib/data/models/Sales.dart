import 'package:json_annotation/json_annotation.dart';

part 'Product.g.dart';

class Sales {
  @JsonKey(name: 'id_sale')
  final int sid;
  final double total;
  final DateTime? createdat;
  Sales({required this.sid, required this.total, required this.createdat});
}
