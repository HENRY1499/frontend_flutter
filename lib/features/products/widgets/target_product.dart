import 'package:flutter/material.dart';
import 'package:prueba_tecnica/features/products/widgets/add_product.dart';

class TargetProduct extends StatefulWidget {
  const TargetProduct({super.key});

  @override
  State<TargetProduct> createState() => _TargetProductState();
}

class _TargetProductState extends State<TargetProduct> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // <-- permite que el botón sobresalga
      children: [
        GestureDetector(
          onTap: () => print("Detalle de este producto"),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 2000),
            curve: Curves.linear,
            constraints: BoxConstraints(minWidth: 100, maxWidth: 150),
            height: 200,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 7.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 150,
                  child: Image.asset(
                    'assets/images/product.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Producto 01",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "S/.2.00",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[200],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "detalle del producto",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(top: -5, right: 0, child: AddProduct()),
      ],
    );
  }
}
