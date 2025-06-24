import 'package:flutter/material.dart';

class CustomTargetProduct extends StatefulWidget {
  final double price;
  final String name;
  final String details;
  const CustomTargetProduct({
    super.key,
    required this.price,
    required this.name,
    required this.details,
  });

  @override
  State<CustomTargetProduct> createState() => _CustomTargetProductState();
}

class _CustomTargetProductState extends State<CustomTargetProduct> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
          constraints: BoxConstraints(minWidth: 100, maxWidth: 150),
          height: 200,
          margin: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 7.0,
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
              SizedBox(
                width: 100,
                child: Image.asset('assets/images/product.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.0,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('S/. ${widget.price.toStringAsFixed(2)}'),
                    Text(
                      widget.details,
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: _AddProduct(onTap: () => {print('Agregado al carrito')}),
        ),
      ],
    );
  }
}

class _AddProduct extends StatelessWidget {
  final VoidCallback onTap;
  const _AddProduct({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2, strokeAlign: 3.0),
          boxShadow: [
            BoxShadow(
              color: Colors.green[300]!,
              blurRadius: 3.0,
              spreadRadius: 0.8,
              offset: Offset(1.00, 1.00),
            ),
          ],
        ),
        padding: EdgeInsets.all(4.0),
        child: Icon(Icons.add, color: Colors.white, size: 20),
      ),
    );
  }
}
