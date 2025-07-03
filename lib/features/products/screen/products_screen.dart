import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/features/products/widgets/product_empy.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    return products.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error:$err')),
      data: (products) {
        if (!products.isEmpty) {
          return const ProductEmpy();
        } else {
          return Text("data");
        }
      },
    );
  }
}
