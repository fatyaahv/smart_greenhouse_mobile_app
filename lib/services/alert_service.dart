import 'dart:async';
import 'package:flutter/material.dart';
import '../models/alert_model.dart';
import 'notification_service.dart';

class AlertService {
  static final AlertService _instance = AlertService._internal();
  factory AlertService() => _instance;
  AlertService._internal();

  final StreamController<AlertModel?> _alertController =
      StreamController.broadcast();

  Stream<AlertModel?> get alertStream => _alertController.stream;

  Timer? _timer;

  void triggerCriticalAlert({
    required BuildContext context,
    required AlertModel alert,
    required VoidCallback onTimeout,
  }) {
    _alertController.add(alert);

    NotificationService().showCriticalAlert(
      context: context,
      alert: alert,
    );

    _timer?.cancel();
    _timer = Timer(
      Duration(seconds: alert.countdownSeconds),
      () {
        triggerEmergency(context: context, alert: alert);
        onTimeout();
      },
    );
  }

  void dismissAlert() {
    _timer?.cancel();
    _alertController.add(null);
  }

  void triggerEmergency({
    required BuildContext context,
    required AlertModel alert,
  }) {
    final emergencyAlert = AlertModel(
      id: alert.id,
      title: '🚨 Emergency Action Taken',
      message: 'System intervened automatically.',
      severity: AlertSeverity.emergency,
      createdAt: DateTime.now(),
      countdownSeconds: 0,
    );

    _alertController.add(emergencyAlert);

    NotificationService().showCriticalAlert(
      context: context,
      alert: emergencyAlert,
    );
  }
}
