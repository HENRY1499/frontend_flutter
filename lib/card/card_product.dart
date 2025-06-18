import 'package:flutter/material.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({super.key});

  @override
  State<CardProduct> createState() => _CardProduct();
}

class _CardProduct extends State<CardProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Producto"),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
      ),
      body: Container(
        padding: EdgeInsets.all(2),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 200,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(children: [Text("Producto 1")]),
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(children: [Text("Producto 1")]),
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(children: [Text("Producto 1")]),
              ),
            ),
            // Expanded(child: Column(children: [Text("Producto 1")])),
            // Expanded(child: Column(children: [Text("Producto 1")])),
          ],
        ),
      ),
    );
  }
}
