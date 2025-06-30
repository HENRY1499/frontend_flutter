import 'package:flutter/material.dart';
import 'package:prueba_tecnica/features/home/screen/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      locale: const Locale('es'),
      supportedLocales: const [Locale('es')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {'/': (context) => const HomeScreen()},
    );
  }
}
