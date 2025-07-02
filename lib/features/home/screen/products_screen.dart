import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/widgets/custom_Buttom.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // prueba
    final products = ref.watch(productsProvider);
    print(products);
    return Container(
      height: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          Image.asset('assets/product_trim.png'),
          Column(
            spacing: 8,
            children: [
              Text(
                "¡Empieza a Vender!",
                style: TextStyle(
                  color: Color(0xFF40C4FF),
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CustomButton(
                name: 'COMENZAR',
                color: Color(0xFF40C4FF),
                textColor: Colors.white,
                isPressed: false,
                fontSize: 12,
                radius: BorderRadius.all(Radius.circular(4)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
