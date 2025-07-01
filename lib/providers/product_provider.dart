import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/data/models/Product.dart';
import 'package:prueba_tecnica/data/services/ProductServices.dart';

final productProvider = StateProvider<String>((ref) => '');
final total = StateProvider<double>((ref) => 0.00);

final productServicesProvider = Provider((ref) => ProductServices());

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final services = ref.read(productServicesProvider);
  return await services.getProducts();
});
