import 'dart:convert';
import 'package:prueba_tecnica/core/utils/constans.dart';
import 'package:prueba_tecnica/data/models/Product.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$apiBaseUrl/product'));
    print('data: ${response.body}');
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }
}
