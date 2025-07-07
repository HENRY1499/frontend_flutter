import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prueba_tecnica/features/detailSales/widget/products_details.dart';
import 'package:prueba_tecnica/features/products/widgets/product_form.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:prueba_tecnica/widgets/appbar.dart';
import 'package:prueba_tecnica/widgets/custom_Buttom.dart';

class SalesDetailsUI extends ConsumerWidget {
  const SalesDetailsUI({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(detailsProvider);
    return Scaffold(
      appBar: AppbarCustom(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: ProductForm(),
                          );
                        },
                      );
                    },
                    name: 'Agregar',
                    color: Color(0xFF40C4FF),
                    textColor: Colors.white,
                    isPressed: false,
                    fontSize: 12,
                    px: 8.0,
                    py: 4.0,
                    icon: Icons.add,
                    radius: BorderRadius.all(Radius.circular(4)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: data.when(
                data:
                    (data) => GridView.builder(
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3 / 1, // ancho / alto
                          ),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final detail = data[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0.0,
                            horizontal: 8.0,
                          ),
                          child: ProductDetails(detail: detail),
                        );
                      },
                    ),
                error: (err, _) => Center(child: Text('$err')),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
