import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/models/Product.dart';
import 'package:prueba_tecnica/features/products/widgets/custom_Product.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 1.5,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CustomTargetProduct(product: products[index]);
      },
    );
  }
}
