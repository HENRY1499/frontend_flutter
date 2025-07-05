import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prueba_tecnica/features/sales/widget/products_details.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:prueba_tecnica/widgets/appbar.dart';

class SalesDetailsUI extends ConsumerWidget {
  const SalesDetailsUI({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(detailsProvider);
    return Scaffold(
      appBar: AppbarCustom(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: data.when(
          data:
              (data) => GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 3 / 1, // ancho / alto
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final detail = data[index];
                  return ProductDetails(detail: detail);
                },
                // children: [
                //   ProductDetails(detail: detail),
                // Text(detail.product.name),
                // Text(detail.product.category.name),
                // Text('Cantidad ${detail.quantity}'),
                // Text('Precio ${detail.salesPrice}'),
                // Text('Pago ${detail.payMethod}'),
                // Text('Stock ${detail.product.stock}'),
                // Text(
                //   'Hora ${DateFormat('dd/MM/yyyy – hh:mm a').format(detail.createdat)}',
                // ),
                // ],
              ),
          error: (err, _) => Center(child: Text('$err')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
