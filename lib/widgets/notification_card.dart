import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(notification.title),
        subtitle: Text(notification.description),
        trailing: Text(
          '${notification.time.hour}:${notification.time.minute.toString().padLeft(2, '0')}',
        ),
      ),
    );
  }
}
