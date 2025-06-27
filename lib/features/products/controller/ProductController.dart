import 'package:prueba_tecnica/data/repositories/RepositoryProduct.dart';
import 'package:prueba_tecnica/data/models/Product.dart';

class ProductController {
  final RepositoryProduct repository;
  // constructor
  ProductController(this.repository);

  Future<List<Product>> getAllProducts() async {
    try {
      final data = await repository.fetchProduct();
      return data;
    } catch (e) {
      print('error en el controlador...:$e');
      throw Exception('Error al obtener productos: $e');
    }
  }
}
