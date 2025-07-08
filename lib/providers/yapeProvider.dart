import 'package:flutter_riverpod/flutter_riverpod.dart';

final yapeNotifierProvider = StateNotifierProvider<YapeNotifier, double>(
  (ref) => YapeNotifier(),
);

class YapeNotifier extends StateNotifier<double> {
  YapeNotifier() : super(0.0);

  void addMonto(double monto) {
    state += monto;
  }

  void reset() {
    state = 0.0;
  }
}
