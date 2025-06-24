import 'package:flutter/material.dart';

class TargetProduct extends StatefulWidget {
  const TargetProduct({super.key});

  @override
  State<TargetProduct> createState() => _TargetProductState();
}

class _TargetProductState extends State<TargetProduct> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => print("Detalle de este producto"),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 2000),
            curve: Curves.linear,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/product.png', fit: BoxFit.cover),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 16.0,
                  ),
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
        Positioned(
          top: 0,
          right: 0,
          child: Icon(Icons.plus_one)),
      ],
    );
  }
}
