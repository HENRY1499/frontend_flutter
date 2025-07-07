import 'package:prueba_tecnica/data/models/SalesDetailResponse.dart';
import 'package:prueba_tecnica/data/services/DetailSalesServices.dart';
import 'package:prueba_tecnica/data/models/SalesDetails.dart';

class RepositorySales {
  final SalesDetailServices salesDetailServices;
  RepositorySales(this.salesDetailServices);

  Future<List<SalesDetailResponse>> fetchDetails() async {
    return await salesDetailServices.getDetails();
  }

  Future<List<Salesdetails>> fetchSalesDetails(
    Map<String, dynamic> detail,
  ) async {
    return await salesDetailServices.saveDetails(detail);
  }
}
