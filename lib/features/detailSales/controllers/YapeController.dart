import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_tecnica/data/repositories/RepositoryYape.dart';
import 'package:prueba_tecnica/providers/yapeProvider.dart';

class YapeNotificationController {
  final Ref ref;
  final YapeRepository repository;

  YapeNotificationController(this.ref, this.repository);

  Future<void> init() async {
    await repository.listenToYapePayments(
      onPaymentDetected: (monto, sender) {
        ref.read(yapeNotifierProvider.notifier).addMonto(monto);
        // Puedes guardar sender si luego quieres un historial
      },
    );
  }
}
