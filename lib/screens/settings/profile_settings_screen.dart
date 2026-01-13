import 'package:flutter/material.dart';
import '../../services/settings_service.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = SettingsService().getUserProfile();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${profile.name}'),
            const SizedBox(height: 8),
            Text('Email: ${profile.email}'),
            const SizedBox(height: 8),
            Text('Phone: ${profile.phone}'),
          ],
        ),
      ),
    );
  }
}
