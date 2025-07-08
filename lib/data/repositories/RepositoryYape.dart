import '../services/YapeServices.dart';

class YapeRepository {
  final YapeNotificationService _service;

  YapeRepository(this._service);

  Future<void> listenToYapePayments({
    required void Function(double monto, String sender) onPaymentDetected,
  }) async {
    final hasPermission = await _service.requestPermission();
    if (!hasPermission) return;

    await _service.startListening(onYapeDetected: onPaymentDetected);
  }
}
