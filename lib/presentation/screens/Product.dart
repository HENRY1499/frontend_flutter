import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black45),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color(0xff5A3D29),
          title: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: isExpanded ? screenWidth * 0.8 : screenWidth * 0.1,
            height: 40.0,
            child: SearchBar(
              hintText: 'Buscar Producto ',
              hintStyle: WidgetStateProperty.all(
                TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              shadowColor: WidgetStateProperty.all(Colors.grey[800]),
              backgroundColor: WidgetStateProperty.all(Color(0xffE9D7C0)),
              elevation: WidgetStateProperty.all(0.7),
              leading: Icon(Icons.search, color: Colors.white),
              onTap: () {
                setState(() {
                  isExpanded = true;
                });
              },
              onTapOutside: (PointerDownEvent event) {
                FocusScope.of(context).unfocus();
                setState(() {
                  isExpanded = false;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
