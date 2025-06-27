import 'package:prueba_tecnica/data/services/ProductServices.dart';
import 'package:prueba_tecnica/data/models/Product.dart';

class Repositoryproduct {
  final ProductServices productServices;

  Repositoryproduct(this.productServices);

  Future<List<Product>> fetchAllProduct() => productServices.getProduct();
}
