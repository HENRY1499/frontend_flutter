import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.all(8),
            color: const Color(0xFF40C4FF), // celeste
            child: Center(
              child: Image.asset(
                "/assets/screensplash.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
