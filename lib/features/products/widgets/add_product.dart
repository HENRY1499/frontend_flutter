import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => print("Agregado al carrito")),
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.green[200]!,
              offset: Offset(2.0, 2.0),
              spreadRadius: 0.8,
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
