import 'package:prueba_tecnica/data/services/ProductServices.dart';
import 'package:prueba_tecnica/data/models/Product.dart';

class RepositoryProduct {
  final ProductServices productServices;

  RepositoryProduct(this.productServices);

  Future<List<Product>> fetchProduct() async {
    return await productServices.getProducts();
  }
}
