import 'package:flutter/material.dart';
import 'package:prueba_tecnica/widgets/custom_Card.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({super.key});

  @override
  State<CardProduct> createState() => _CardProduct();
}

class _CardProduct extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(
                name: "Henry",
                description: "Lorem Ipsum",
                number: 26,
                color: Colors.red,
                icon: Icons.star,
                image: "https://picsum.photos/200/300?random=1",
              ),
              CustomCard(
                name: "Henry",
                description: "Lorem Ipsum",
                number: 26,
                color: Colors.blue,
                icon: Icons.star,
                image: "https://picsum.photos/200/300?random=2",
              ),
              CustomCard(
                name: "Henry",
                description: "Lorem Ipsum",
                number: 26,
                color: Colors.green,
                icon: Icons.star,
                image: "https://picsum.photos/200/300?random=3",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
