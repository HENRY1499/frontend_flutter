import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/repositories/RepositoryProduct.dart';
import 'package:prueba_tecnica/data/services/ProductServices.dart';
import 'package:prueba_tecnica/features/products/controller/ProductController.dart';
import 'package:prueba_tecnica/features/products/widgets/product_grid.dart';
import 'package:prueba_tecnica/features/products/widgets/appbar.dart';

class Product extends StatelessWidget {
  final controller = ProductController(RepositoryProduct(ProductServices()));

  Product({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: controller.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ProductGrid(products: snapshot.data!);
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return Center(
              child: Text("Error al mostrar los productos ${snapshot.error}"),
            );
          }
        },
      ),
    );
  }
}
