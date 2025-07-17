import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/data/models/Product.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';

class FilterProducts extends ConsumerWidget {
  const FilterProducts({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);

    return productsAsync.when(
      data: (products) {
        return Autocomplete<Product>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text.isEmpty)
              return const Iterable<Product>.empty();
            return products.where(
              (p) => p.name.toLowerCase().contains(
                textEditingValue.text.toLowerCase(),
              ),
            );
          },
          displayStringForOption: (Product p) => p.name,
          onSelected:
              (p) => ref.read(productName.notifier).state = p.pid.toString(),
          fieldViewBuilder: (
            context,
            controller,
            focusNode,
            onEditingComplete,
          ) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              decoration: InputDecoration(
                labelText: 'Buscar producto...',
                labelStyle: TextStyle(
                  color: Colors.grey[350],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
                icon: Icon(Icons.shopping_bag),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 24,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
              ),
            );
          },
        );
      },
      loading: () => Center(child: const CircularProgressIndicator()),
      error: (err, _) => Text('Error al cargar productos: $err'),
    );
  }
}
