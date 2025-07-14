import 'package:flutter/material.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterProduct extends ConsumerWidget {
  const FilterProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: GestureDetector(
          onTap: () => {print('presionado')},
          child: Container(
            width: 150,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.ac_unit),
                Icon(Icons.ac_unit),
                Icon(Icons.ac_unit),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
