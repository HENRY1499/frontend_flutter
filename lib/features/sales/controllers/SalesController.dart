import 'package:prueba_tecnica/data/models/Sales.dart';
import 'package:prueba_tecnica/data/models/SalesDetails.dart';
import 'package:prueba_tecnica/data/repositories/RepositorySales.dart';

class SalesController {
  final RepositorySales repositorySales;
  SalesController(this.repositorySales);

  Future<List<Sales>> getDetails() async {
    try {
      final data = await repositorySales.fetchDetails();
      return data;
    } catch (e) {
      throw Exception('Error al traer los detalles de ventas');
    }
  }

  Future<List<Salesdetails>> postDetails(Map<String, dynamic> detail) async {
    try {
      final data = await repositorySales.fetchSalesDetails(detail);
      return data;
    } catch (e) {
      throw Exception('Error al guardar los detalles de ventas');
    }
  }
}
