import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';

class Employed extends ConsumerWidget {
  const Employed({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final method = ref.watch(sumMethodType);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Métodos de Pago',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 24,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10.0,
            children:
                method.entries.map((method) {
                  final metodo = method.key;
                  final total = method.value;
                  return Expanded(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400]!,
                            offset: Offset(4.0, 4.0),
                            spreadRadius: 1,
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              metodo.toUpperCase(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'S/. ${total.toStringAsFixed(2)}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontFamily: 'Montserrat',
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
    // final sales = ref.watch();
    // return ListView.builder(itemBuilder: sales.lenght);
  }
}
