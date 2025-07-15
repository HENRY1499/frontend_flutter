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

// Boton "id" - Capturamos el "id" delos botones en TabsUser
final buttonID = StateProvider<int>((ref) => 0);
// filter

final filterData = Provider<AsyncValue<List<SalesDetailResponse>>>((ref) {
  final id = ref.watch(buttonID);
  final detailAsync = ref.watch(detailsProvider);

  return detailAsync.when(
    data: (d) {
      final response =
          id == 0 ? d : d.where((e) => e.product.users == id).toList();
      return AsyncValue.data(response);
    },

    loading: () => const AsyncValue.loading(),
    error: (err, stack) => AsyncValue.error(err, stack),
  );
});

// SUMA DE TOTALES SEGUN EFECTIVO O YAPE
final sumMethodType = Provider<Map<String, double>>((ref) {
  final detailsAsync = ref.watch(filterData);

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
