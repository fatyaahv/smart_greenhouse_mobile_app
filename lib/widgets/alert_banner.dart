import 'package:flutter/material.dart';
import '../models/alert_model.dart';
import '../services/alert_service.dart';

class AlertBanner extends StatelessWidget {
  final AlertModel alert;

  const AlertBanner({super.key, required this.alert});

  Color get color {
    switch (alert.severity) {
      case AlertSeverity.warning:
        return Colors.orange;
      case AlertSeverity.critical:
        return Colors.red;
      case AlertSeverity.emergency:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withValues(alpha: 0.95),
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            const Icon(Icons.warning, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(alert.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text(alert.message,
                      style: const TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            if (alert.severity == AlertSeverity.critical)
              TextButton(
                onPressed: () {
                  AlertService().dismissAlert();
                },
                child: const Text(
                  'FIX NOW',
                  style: TextStyle(color: Colors.white),
                ),
              )
          ],
        ),
      ),
    );
  }
}
