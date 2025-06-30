import 'package:flutter/material.dart';
import 'package:prueba_tecnica/features/home/screen/home_screen.dart';
// import 'package:prueba_tecnica/card/card_product.dart';
// import 'package:prueba_tecnica/features/products/screen/Product.dart';
// import 'package:prueba_tecnica/presentation/screens/counter_function_screen.dart';
// import 'package:prueba_tecnica/presentation/screens/counter_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba Tecnica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/':(context)=>const HomeScreen(),
      },
    );
  }
}
