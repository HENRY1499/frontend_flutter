import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/data/models/Product.dart';
import 'package:prueba_tecnica/data/models/SalesDetails.dart';
import 'package:prueba_tecnica/data/services/ProductServices.dart';
import 'package:prueba_tecnica/features/sales/controllers/SalesController.dart';

final productProvider = StateProvider<String>((ref) => '');
final total = StateProvider<double>((ref) => 0.00);

// Details
final productName = StateProvider<String>((ref) => '');

final productServicesProvider = Provider((ref) => ProductServices());

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final services = ref.read(productServicesProvider);
  return await services.getProducts();
});
// aca se llama al controlador que ya tiene el repository, y este ya tiene al servicio
// final salesProvider = Provider<SalesController>((ref) {
//   return SalesController(RepositorySales(SalesServices()));
// });
// Controller - AsyncProvider
final detailsProvider =
    AsyncNotifierProvider<SalesController, List<Salesdetails>>(
      SalesController.new,
    );
