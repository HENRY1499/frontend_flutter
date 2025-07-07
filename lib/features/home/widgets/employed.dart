import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Employed extends ConsumerWidget {
  const Employed({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          color: Colors.black,
          width: 1,
          strokeAlign: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text('data')],
      ),
    );
    // final sales = ref.watch();
    // return ListView.builder(itemBuilder: sales.lenght);
  }
}
