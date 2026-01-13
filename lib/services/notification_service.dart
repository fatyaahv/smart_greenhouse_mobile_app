import 'package:flutter/material.dart';
import '../models/alert_model.dart';

class NotificationService {
  static final NotificationService _instance =
      NotificationService._internal();

  factory NotificationService() => _instance;
  NotificationService._internal();

  /// Initialize notification system
  /// (Later: Firebase Cloud Messaging setup)
  Future<void> init() async {
    // Intentionally empty for now
    // Firebase + permissions will be added later
  }

  /// Temporary UI-based alert (SnackBar)
  void showCriticalAlert({
    required BuildContext context,
    required AlertModel alert,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: _getColor(alert.severity),
        duration: const Duration(seconds: 6),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              alert.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              alert.message,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(AlertSeverity severity) {
    switch (severity) {
      case AlertSeverity.warning:
        return Colors.orange;
      case AlertSeverity.critical:
        return Colors.red;
      case AlertSeverity.emergency:
        return Colors.red.shade900;
    }
  }
}
