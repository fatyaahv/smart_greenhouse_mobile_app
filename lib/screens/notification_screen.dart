import 'package:flutter/material.dart';
import '../services/data_service.dart';
import '../widgets/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = DataService.getNotifications();

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        children: notifications
            .map((n) => NotificationCard(notification: n))
            .toList(),
      ),
    );
  }
}
