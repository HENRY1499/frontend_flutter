import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';

class ListHistory extends ConsumerWidget {
  const ListHistory({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.read(detailsProvider);
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          color: Colors.black,
          width: 1,
          strokeAlign: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text('data')],
        ),
      ),
    );
    // final sales = ref.watch();
    // return ListView.builder(itemBuilder: sales.lenght);
  }
}
