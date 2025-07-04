import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/features/products/widgets/product_empy.dart';
import 'package:prueba_tecnica/features/sales/screen/SalesDetail.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(detailsProvider);
    print('UI:$details');
    return details.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error:$err')),
      data: (details) {
        if (details.isEmpty) {
          return const ProductEmpy();
        } else {
          return SalesDetailsUI();
        }
      },
    );
  }
}
