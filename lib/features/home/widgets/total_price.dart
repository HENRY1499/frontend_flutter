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
    final salesAsync = ref.watch(salesProvider);
    return salesAsync.when(
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('$err')),
      data: (data) {
        final total = data.fold(0.0, (acc, item) => acc + item.total);
        return _builTotal(fechaFormateada, total);
      },
    );
  }
}

Widget _builTotal(String fecha, double total) {
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
            fecha,
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
                '$total',
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
