import 'package:prueba_tecnica/data/models/SalesDetails.dart';
import 'package:prueba_tecnica/data/repositories/RepositorySales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/data/services/SalesServices.dart';

class SalesController extends AsyncNotifier<List<Salesdetails>> {
  final repository = RepositorySales(SalesServices());
  @override
  Future<List<Salesdetails>> build() async {
    return await _loadDetails();
  }

  Future<List<Salesdetails>> _loadDetails() async {
    return await repository.fetchDetails();
  }

  Future<void> refreshDetails() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadDetails());
  }

  Future<List<Salesdetails>> postDetails(Map<String, dynamic> detail) async {
    try {
      final result = await repository.fetchSalesDetails(detail);
      await refreshDetails();
      return result;
    } catch (e) {
      throw Exception('Error en el controlador:$e');
    }
  }
}
