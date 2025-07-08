import 'package:flutter_notification_listener/flutter_notification_listener.dart';

class YapeNotificationService {
  Future<bool> requestPermission() async {
    final hasPermission = await NotificationsListener.hasPermission;
    if (hasPermission != true) {
      await NotificationsListener.openPermissionSettings();
      return false;
    }
    return true;
  }

  Future<void> startListening({
    required void Function(double monto, String sender) onYapeDetected,
  }) async {
    await NotificationsListener.initialize();

    final port = NotificationsListener.receivePort;
    if (port != null) {
      port.listen((dynamic evt) {
        if (evt is Map) {
          final event = NotificationEvent.fromMap(
            Map<String, dynamic>.from(evt),
          );

          if (event.packageName == "com.bcp.innovacxion.yapeapp") {
            final text = event.text ?? "";
            final match = RegExp(
              r'Has recibido S/ ([\d\.]+) de (.+)',
            ).firstMatch(text);
            if (match != null) {
              final monto = double.tryParse(match.group(1) ?? "0.0") ?? 0.0;
              final sender = match.group(2) ?? '';
              onYapeDetected(monto, sender);
            }
          }
        } else {
          print("⚠️ Evento no reconocido: $evt");
        }
      });
    } else {
      print(
        "❗️NotificationsListener.receivePort es null. Asegúrate de llamar a initialize() primero.",
      );
    }

    await NotificationsListener.startService(foreground: true);
  }
}
