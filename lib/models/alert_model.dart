enum AlertSeverity { warning, critical, emergency }

class AlertModel {
  final String id;
  final String title;
  final String message;
  final AlertSeverity severity;
  final DateTime createdAt;
  final int countdownSeconds;

  AlertModel({
    required this.id,
    required this.title,
    required this.message,
    required this.severity,
    required this.createdAt,
    this.countdownSeconds = 60,
  });
}
