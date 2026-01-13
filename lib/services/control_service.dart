import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import '../models/alert_model.dart';
import 'alert_service.dart';

class ControlService {
  static final ControlService _instance = ControlService._internal();
  factory ControlService() => _instance;
  ControlService._internal();

  BuildContext? _context;

  void setContext(BuildContext context) {
    _context = context;
  }

  // === THRESHOLDS ===
  static const double maxTemp = 32.0;
  static const double minHumidity = 40.0;

  void processSensorData({
    required double temperature,
    required double humidity,
  }) {
    if (temperature > maxTemp) {
      _handleOverheat(temperature);
    }

    if (humidity < minHumidity) {
      _handleLowHumidity(humidity);
    }
  }

  // ================= TEMPERATURE =================

  void _handleOverheat(double temp) {
    if (_context == null) return;
    AlertService().triggerCriticalAlert(
      context: _context!,
      alert: AlertModel(
        id: 'TEMP_HIGH',
        title: '🔥 High Temperature',
        message:
            'Temperature reached ${temp.toStringAsFixed(1)}°C.\nTurn ON ventilation manually.',
        severity: AlertSeverity.critical,
        createdAt: DateTime.now(),
        countdownSeconds: 60,
      ),
      onTimeout: _autoTurnOnFan,
    );
  }

  void _autoTurnOnFan() {
    developer.log(
      'AUTO ACTION: Fan turned ON',
      name: 'ControlService',
      level: 900, // WARNING
    );

    // TODO: ESP32 / API / MQTT integration
  }

  // ================= HUMIDITY =================

  void _handleLowHumidity(double humidity) {
    if (_context == null) return;
    AlertService().triggerCriticalAlert(
      context: _context!,
      alert: AlertModel(
        id: 'HUM_LOW',
        title: '💧 Low Humidity',
        message:
            'Humidity dropped to ${humidity.toStringAsFixed(1)}%.\nTurn ON irrigation.',
        severity: AlertSeverity.critical,
        createdAt: DateTime.now(),
        countdownSeconds: 60,
      ),
      onTimeout: _autoTurnOnIrrigation,
    );
  }

  void _autoTurnOnIrrigation() {
    developer.log(
      'AUTO ACTION: Irrigation turned ON',
      name: 'ControlService',
      level: 900,
    );

    // TODO: ESP32 / API / MQTT integration
  }
}
