import 'package:flutter/material.dart';

class AppbarCustom extends StatefulWidget implements PreferredSizeWidget {
  const AppbarCustom({super.key});

  @override
  State<AppbarCustom> createState() => _AppbarState();
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _AppbarState extends State<AppbarCustom> {
  bool isExpanded = false;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
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
    );
  }
}
