import 'dart:convert';
import 'package:prueba_tecnica/core/utils/constans.dart';
import 'package:prueba_tecnica/data/models/Sales.dart';
import 'package:prueba_tecnica/data/models/SalesDetails.dart';
import 'package:http/http.dart' as http;

class SalesServices {
  Future<List<Sales>> getDetails() async {
    final response = await http.post(Uri.parse('$apiBaseUrl/sales/details'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Sales.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar ventas');
    }
  }

  Future<List<Salesdetails>> saveDetails(Map<String, dynamic> data) async {
    print('llegada de la data $data');
    final payload = {
      "details": [data],
    };
    final response = await http.post(
      Uri.parse('$apiBaseUrl/sales/createDetail'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );
    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['details'] ?? [];
      return data.map((json) => Salesdetails.fromJson(json)).toList();
    } else {
      throw Exception(jsonDecode(response.body)["error"]);
    }
  }
}
