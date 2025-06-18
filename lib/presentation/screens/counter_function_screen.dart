import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clickCount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador"),
        leading: IconButton(
          icon: Icon(Icons.refresh_rounded),
          onPressed: () {
            setState(() {
              clickCount = 0;
            });
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickCount',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w200),
            ),
            Text(
              (clickCount != 1 ? "clicks" : "click"),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh,
            onPressed: () {
              clickCount = 0;
              setState(() {});
            },
          ),
          SizedBox(height: 10),
          CustomButton(
            icon: Icons.one_k_plus,
            onPressed: () {
              clickCount++;
              setState(() {});
            },
          ),
          SizedBox(height: 10),
          CustomButton(
            icon: Icons.access_alarm,
            onPressed: () {
              if (clickCount == 0) return;
              clickCount--;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: StadiumBorder(),
      backgroundColor: Color(0xf6ab2699),
      enableFeedback: true,
      elevation: 5,
      focusElevation: 5,
      onPressed: onPressed,
      focusColor: Color(0xf6ab2260),
      child: Icon(icon),
    );
  }
}
