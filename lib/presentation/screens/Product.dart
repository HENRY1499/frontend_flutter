import 'package:flutter/material.dart';
import 'package:prueba_tecnica/widgets/custom_Buttom.dart';
import 'package:prueba_tecnica/widgets/custom_Product.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  bool isExpanded = false;
  int selectedIndex = 0;
  final List<String> categories = [
    "Calzado",
    "Ropa",
    "Accesorios",
    "Tecnología",
    "Hogar",
    "Deportes",
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.grey[400],
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
                    "Productos",
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
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8.0,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(categories.length, (index) {
                  return CustomButton(
                    name: categories[index],
                    height: 40,
                    color: Colors.white,
                    textColor: Colors.black,
                    isPressed: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex =
                            index; // Actualiza el índice del botón activo
                      });
                    },
                  );
                }),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8.0,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Calzado", style: TextStyle(fontSize: 18)),
                      CustomButton(
                        name: "Ver más",
                        color: Colors.blueAccent,
                        radius: BorderRadius.all(Radius.circular(100)),
                        textColor: Colors.white,
                        isPressed: false,
                        height: 25,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.0,
                      vertical: 2.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTargetProduct(
                          price: 10.00,
                          name: "Aceite",
                          details: "Aceite Primor de 900ml",
                        ),
                        CustomTargetProduct(
                          price: 1.00,
                          name: "Oreo",
                          details: "Oreo Taco",
                        ),
                        CustomTargetProduct(
                          price: 0.60,
                          name: "Rellenita",
                          details: "Rellenita de Fresa",
                        ),
                        CustomTargetProduct(
                          price: 0.50,
                          name: "Velas",
                          details: "Se te fue la luz?.",
                        ),
                        CustomTargetProduct(
                          price: 1.50,
                          name: "Trident",
                          details: "Cantidad 12 Trident de sabor Mora.",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleCard extends StatefulWidget {
  final String title;
  const _TitleCard({super.key, required this.title});

  @override
  State<_TitleCard> createState() => __TitleCardState();
}

class __TitleCardState extends State<_TitleCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w200),
        ),
        CustomButton(
          name: "Ver más",
          height: 20,
          onTap: () {},
          textColor: Colors.white,
          radius: BorderRadius.all(Radius.circular(100)),
          color: Colors.blue,
          fontSize: 12.0,
          isPressed: false,
        ),
      ],
    );
  }
}
