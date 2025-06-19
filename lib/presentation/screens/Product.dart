import 'package:flutter/material.dart';
import 'package:prueba_tecnica/widgets/customCard.dart';

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
          backgroundColor: const Color(0xff5A3D29),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "Hola",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: isExpanded ? screenWidth * 0.5 : screenWidth * 0.1,
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
                  backgroundColor:
                      isExpanded
                          ? WidgetStateProperty.all(Color(0xffE9D7C0))
                          : WidgetStateProperty.all(
                            Color.fromARGB(162, 233, 215, 192),
                          ),
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
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCard(
                    name: "Producto",
                    description: "description",
                    number: 1,
                    color: Colors.red,
                    icon: Icons.shopping_cart,
                    image: Image.asset("assets/images/product.png"),
                  ),
                  CustomCard(
                    name: "Producto",
                    description: "description",
                    number: 1,
                    color: Colors.red,
                    icon: Icons.shopping_cart,
                    image: Image.asset("assets/images/product.png"),
                  ),
                  CustomCard(
                    name: "Producto",
                    description: "description",
                    number: 1,
                    color: Colors.red,
                    icon: Icons.shopping_cart,
                    image: Image.asset("assets/images/product.png"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
