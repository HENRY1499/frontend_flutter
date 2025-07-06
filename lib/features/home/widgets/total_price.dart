import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prueba_tecnica/providers/product_provider.dart';

class TotalPrice extends ConsumerStatefulWidget {
  const TotalPrice({super.key});

  @override
  ConsumerState<TotalPrice> createState() => _TotalPrice();
}

class _TotalPrice extends ConsumerState<TotalPrice> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ahora = DateTime.now();
    final fechaFormateada = DateFormat.yMMMMd('es').format(ahora);
    final data = ref.watch(
      detailsProvider.select(
        (value) => value.maybeWhen(
          data: (list) => list.fold(0.0, (acc, item) => acc + item.salesPrice),
          orElse: () => 0.0,
        ),
      ),
    );
    print('Total: $data');
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              fechaFormateada,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            Text(
              "Total",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("S/"),
                Text(
                  '$data',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
