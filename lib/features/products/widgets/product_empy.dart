import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/features/products/widgets/product_form.dart';
import 'package:prueba_tecnica/widgets/custom_Buttom.dart';

class ProductEmpy extends ConsumerWidget {
  const ProductEmpy({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
