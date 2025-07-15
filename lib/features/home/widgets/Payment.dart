import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:lottie/lottie.dart';

class PaymentMethod extends ConsumerWidget {
  const PaymentMethod({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final method = ref.watch(sumMethodType);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        method.isEmpty
            ? Center(
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/lotties/Wallet.json',
                    width: 150,
                    height: 150,
                    repeat: true,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'No hay métodos de pago registrados.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
            : Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 5,
                    children: [
                      Icon(Icons.payments, color: Colors.green[300]),
                      Text(
                        'Pago',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                        method.entries.map((method) {
                          final metodo = method.key;
                          final total = method.value;
                          return Container(
                            width: 190,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    method.key == 'yape'
                                        ? Colors.purpleAccent
                                        : Colors.green,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    metodo.toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 2,
                                      color:
                                          method.key == 'yape'
                                              ? Colors.purple
                                              : Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'S/. ${total.toStringAsFixed(2)}',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        color:
                                            method.key == 'yape'
                                                ? Colors.purple
                                                : Colors.green,
                                        fontFamily: 'Montserrat',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
      ],
    );
    // final sales = ref.watch();
    // return ListView.builder(itemBuilder: sales.lenght);
  }
}
