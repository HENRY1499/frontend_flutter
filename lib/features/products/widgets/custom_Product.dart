import 'package:flutter/material.dart';
import 'package:prueba_tecnica/data/models/Product.dart';
import 'package:prueba_tecnica/features/products/widgets/add_product.dart';

class CustomTargetProduct extends StatefulWidget {
  final Product product;
  const CustomTargetProduct({super.key, required this.product});

  @override
  State<CustomTargetProduct> createState() => _CustomTargetProductState();
}

class _CustomTargetProductState extends State<CustomTargetProduct> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // <-- permite que el botón sobresalga
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 2.0,
            horizontal: .0,
          ), // <-- Agrega esto
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10), // <-- Muy recomendable
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFC1C1C1),
                offset: Offset(3.0, 3.0),
                blurRadius: 2.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    'assets/images/product.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'S/. ${widget.product.salesPrice.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.black, fontSize: 10.0),
                      ),
                      Text(
                        widget.product.description,
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(top: 0, right: 0, child: AddProduct()),
      ],
    );
  }
}
