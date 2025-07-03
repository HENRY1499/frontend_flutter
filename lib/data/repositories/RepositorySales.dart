import 'package:prueba_tecnica/data/services/SalesServices.dart';
import 'package:prueba_tecnica/data/models/Sales.dart';
import 'package:prueba_tecnica/data/models/SalesDetails.dart';

class RepositorySales {
  final SalesServices salesServices;
  RepositorySales(this.salesServices);

  Future<List<Sales>> fetchDetails() async {
    return await salesServices.getDetails();
  }

  Future<List<Salesdetails>> fetchSalesDetails(
    Map<String, dynamic> detail,
  ) async {
    return await salesServices.saveDetails(detail);
  }
}
