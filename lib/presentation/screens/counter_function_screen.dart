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
          FloatingActionButton(
            onPressed: () {
              setState(() {
                clickCount++;
              });
            },
            child: Icon(Icons.plus_one),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                clickCount--;
              });
            },
            child: Icon(Icons.exposure_minus_1_outlined),
          ),
        ],
      ),
    );
  }
}
