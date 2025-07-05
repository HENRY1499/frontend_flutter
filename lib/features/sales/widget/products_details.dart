import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/data/models/SalesDetailResponse.dart';

class ProductDetails extends ConsumerWidget {
  final SalesDetailResponse detail;
  const ProductDetails({super.key, required this.detail});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.product.name,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  detail.payMethod,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 10,
                    color:
                        detail.payMethod == 'efectivo'
                            ? Colors.green
                            : Colors.purple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Expanded(child: Text('5')),
          ],
        ),
      ),
    );
  }
}
