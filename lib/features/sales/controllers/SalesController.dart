import 'package:prueba_tecnica/data/repositories/RepositorySales.dart';
import 'package:prueba_tecnica/data/models/Sales.dart';
import 'package:prueba_tecnica/data/services/SaleServices.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repository = RepositorySales(SaleServices());

class SalesController extends AsyncNotifier<List<Sales>> {
  @override
  Future<List<Sales>> build() async {
    try {
      return await repository.fetchSales();
    } catch (e) {
      throw Exception('Error al obtener ventas $e');
    }
  }

  Future<void> refreshSales() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.fetchSales());
  }
}
