import 'dart:convert';
import 'package:prueba_tecnica/core/utils/constans.dart';
import 'package:prueba_tecnica/data/models/SalesDetails.dart';
import 'package:http/http.dart' as http;

class SalesServices {
  Future<List<Salesdetails>> getDetails() async {
    final response = await http.get(Uri.parse('$apiBaseUrl/sales/details'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Salesdetails.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar ventas');
    }
  }

  Future<List<Salesdetails>> saveDetails(Map<String, dynamic> data) async {
    final payload = {
      "details": [data],
    };
    final response = await http.post(
      Uri.parse('$apiBaseUrl/sales/createDetail'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['details'] ?? [];
      return data.map((json) => Salesdetails.fromJson(json)).toList();
    } else {
      throw Exception(jsonDecode(response.body)["error"]);
    }
  }
}
