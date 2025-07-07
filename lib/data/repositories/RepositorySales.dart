import 'package:prueba_tecnica/data/services/SaleServices.dart';
import 'package:prueba_tecnica/data/models/Sales.dart';

class RepositorySales {
  final SaleServices saleServices;

  RepositorySales(this.saleServices);

  Future<List<Sales>> fetchSales() async {
    return await saleServices.getSales();
  }
}
