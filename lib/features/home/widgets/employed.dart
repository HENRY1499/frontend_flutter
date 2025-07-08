import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Employed extends ConsumerWidget {
  const Employed({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text('data')],
    );
    // final sales = ref.watch();
    // return ListView.builder(itemBuilder: sales.lenght);
  }
}
