import 'package:prueba_tecnica/data/models/SalesDetailResponse.dart';
import 'package:prueba_tecnica/data/models/SalesDetails.dart';
import 'package:prueba_tecnica/data/repositories/RepositorySalesDetails.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/data/services/DetailSalesServices.dart';

final repository = RepositorySales(SalesDetailServices());

class SalesGetController extends AsyncNotifier<List<SalesDetailResponse>> {
  @override
  Future<List<SalesDetailResponse>> build() async {
    return await repository.fetchDetails();
  }

  Future<void> refreshDetails() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.fetchDetails());
  }
}

class SalesPostController extends AsyncNotifier<List<Salesdetails>> {
  @override
  Future<List<Salesdetails>> build() async {
    return [];
  }

  Future<List<Salesdetails>> postDetails(Map<String, dynamic> detail) async {
    try {
      final result = await repository.fetchSalesDetails(detail);
      return result;
    } catch (e) {
      throw Exception('Error en el controlador:$e');
    }
  }
}

