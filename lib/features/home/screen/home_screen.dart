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
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(detailCount);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TotalPrice(),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductsScreen()),
                );
              },
              name: data <= 0 ? "Comenzar" : 'Seguir Vendiendo',
              color: Colors.green,
              textColor: Colors.white,
              fontSize: 12,
              isPressed: false,
              py: 10.0,
              radius: BorderRadius.circular(4),
            ),
            SizedBox(height: 45),
            Employed(),
          ],
        ),
      ),
    );
  }
}

//
