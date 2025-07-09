import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:lottie/lottie.dart';

class Employed extends ConsumerWidget {
  const Employed({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final method = ref.watch(sumMethodType);
    print('Metodos de pago $method');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Métodos de Pago',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 10,
                    children:
                        method.entries.map((method) {
                          final metodo = method.key;
                          final total = method.value;
                          return Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    method.key == 'yape'
                                        ? Colors.purpleAccent
                                        : Colors.green,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    metodo.toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 3,
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
                                        fontSize: 30,
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
        ],
      ),
    );
    // final sales = ref.watch();
    // return ListView.builder(itemBuilder: sales.lenght);
  }
}
