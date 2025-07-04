import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';

class SalesDetailsUI extends ConsumerWidget {
  const SalesDetailsUI({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(detailsProvider);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Detalle de Ventas'),
              IconButton(
                icon: Icon(Icons.refresh, color: Colors.black),
                onPressed: () {
                  ref.read(detailsProvider.notifier).refreshDetails();
                },
              ),
            ],
          ),
        ),
      ),

      body: data.when(
        data:
            (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final detail = data[index];
                return ListTile(
                  title: Text('Venta N° ${index + 1}'),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(detail.product.name),
                      Text(detail.product.category.name),
                      Text('Cantidad ${detail.quantity}'),
                      Text('Precio ${detail.salesPrice}'),
                      Text('Precio ${detail.payMethod}'),
                      Text(
                        'Hora ${DateFormat('dd/MM/yyyy – hh:mm a').format(detail.createdat)}',
                      ),
                    ],
                  ),
                );
              },
            ),
        error: (err, _) => Center(child: Text('$err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
