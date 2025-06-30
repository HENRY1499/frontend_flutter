import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/features/home/widgets/total_price.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:prueba_tecnica/widgets/custom_Buttom.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends ConsumerState<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  String searchText = '';
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productProvider);
    final present = DateTime.now;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF40C4FF),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8.0,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8.0,
              children: [
                Image.asset('assets/icon.png'),
                Text(
                  'TIENDA',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SearchBar(
                    controller: controller,
                    hintText: 'Buscar Producto ',
                    backgroundColor: WidgetStateProperty.all(Colors.white),
                    constraints: const BoxConstraints(
                      minHeight: 30.0, // puedes ajustar este valor
                      maxHeight: 30.0,
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    hintStyle: WidgetStateProperty.all(
                      TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                      ),
                    ),
                    leading: Icon(Icons.search, color: const Color(0xFF40C4FF)),
                    onChanged:
                        (value) => {
                          setState(() {
                            searchText = value;
                          }),
                        },
                  ),
                ),
                //CONTINUAR DESDE AQUI
              ],
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TotalPrice(),
          CustomButton(
            name: "Comenzar Ventas",
            color: Colors.green,
            textColor: Colors.white,
            isPressed: false,
            radius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}

//
