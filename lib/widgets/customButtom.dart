import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String name;
  const CustomButton({super.key, required this.name});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Acción al presionar el botón
            print('Botón presionado: ${widget.name}');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff5A3D29),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            widget.name,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
