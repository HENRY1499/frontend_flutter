import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
                  "0.00",
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
