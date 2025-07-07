import 'dart:convert';
import 'package:prueba_tecnica/core/utils/constans.dart';
import 'package:prueba_tecnica/data/models/Sales.dart';
import 'package:http/http.dart' as http;

class SaleServices {
  Future<List<Sales>> getSales() async {
    final response = await http.get(Uri.parse('$apiBaseUrl/sales/'));
    print('data: ${response.body}');
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Sales.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar ventas');
    }
  }
}
