import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/data/models/Product.dart';
import 'package:prueba_tecnica/data/models/Sales.dart';
import 'package:prueba_tecnica/data/models/SalesDetailResponse.dart';
import 'package:prueba_tecnica/data/models/SalesDetails.dart';
import 'package:prueba_tecnica/data/services/ProductServices.dart';
import 'package:prueba_tecnica/features/detailSales/controllers/SalesController.dart';
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
    AsyncNotifierProvider<SalesGetController, List<SalesDetailResponse>>(
      SalesGetController.new,
    );

final postDetailsProvider =
    AsyncNotifierProvider<SalesPostController, List<Salesdetails>>(
      SalesPostController.new,
    );

//SALES - ASYNCPROVIDER
final salesProvider = AsyncNotifierProvider<SalesController, List<Sales>>(
  SalesController.new,
);

// SUMA DE TOTALES SEGUN EFECTIVO O YAPE
final sumMethodType = Provider<Map<String, double>>((ref) {
  final detailsAsync = ref.watch(detailsProvider);

  return detailsAsync.when(
    data: (detail) {
      final Map<String, double> data = {};

      for (final item in detail) {
        final method = item.payMethod;
        final quantity = item.quantity;
        final total = item.salesPrice * quantity;

        if (data.containsKey(method)) {
          data[method] = data[method]! + total;
        } else {
          data[method] = total;
        }
      }
      return data;
    },
    error: (e, _) => {},
    loading: () => {},
  );
});

final detailCount = Provider<int>((ref) {
  final detailAsync = ref.watch(detailsProvider);
  return detailAsync.when(
    data: (detail) {
      return detail.length;
    },
    error: (err, _) => 0,
    loading: () => 0,
  );
});
