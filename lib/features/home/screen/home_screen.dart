import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/features/home/widgets/employed.dart';
import 'package:prueba_tecnica/features/products/screen/products_screen.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF40C4FF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Text(
              'filtros',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TotalPrice(),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductsScreen()),
                );
              },
              name: "Comenzar",
              color: Colors.green,
              textColor: Colors.white,
              isPressed: false,
              radius: BorderRadius.circular(4),
            ),
            Employed(),
          ],
        ),
      ),
    );
  }
}

//
