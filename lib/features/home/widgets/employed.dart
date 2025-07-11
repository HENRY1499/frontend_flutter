import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:lottie/lottie.dart';

class Employed extends ConsumerWidget {
  const Employed({super.key});
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
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200]!,
                    offset: Offset(1, 1),
                    spreadRadius: 2,
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Column(
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
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.spaceBetween,
                    children:
                        method.entries.map((method) {
                          final metodo = method.key;
                          final total = method.value;
                          return Container(
                            width: 180,
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
                              padding: EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    metodo.toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 20,
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
                                        fontSize: 28,
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
