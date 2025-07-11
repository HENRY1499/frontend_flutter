import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:prueba_tecnica/features/products/screen/products_screen.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:prueba_tecnica/widgets/custom_Buttom.dart';

class TotalPrice extends ConsumerStatefulWidget {
  const TotalPrice({super.key});

  @override
  ConsumerState<TotalPrice> createState() => _TotalPrice();
}

class _TotalPrice extends ConsumerState<TotalPrice> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ahora = DateTime.now();
    final fechaFormateada = DateFormat.yMMMMEEEEd('es_PE').format(ahora);
    final salesAsync = ref.watch(salesProvider);
    return salesAsync.when(
      loading:
          () => Center(
            child: Column(
              children: [
                Lottie.asset(
                  'assets/lotties/CountTotal.json',
                  width: 100,
                  height: 100,
                  repeat: true,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
      error: (err, _) => Center(child: Text('$err')),
      data: (data) {
        final total = data.fold(0.0, (acc, item) => acc + item.total);
        return _builTotal(fechaFormateada, total, context, data.length);
      },
    );
  }
}

Widget _builTotal(String fecha, double total, BuildContext context, int data) {
  return Container(
    width: double.infinity,
    height: 250,
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          Text(
            fecha,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          Text(
            "Total",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("S/"),
                  Text(
                    '${total.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 48,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 24.0,
                ),
                child: CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductsScreen()),
                    );
                  },
                  name: data <= 0 ? "Comenzar" : 'Seguir Vendiendo',
                  color: Colors.green,
                  textColor: Colors.white,
                  fontSize: 12,
                  isPressed: false,
                  py: 10.0,
                  radius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
