import 'package:flutter/material.dart';
import '../../services/settings_service.dart';
import '../../models/greenhouse_model.dart';

class GreenhouseSettingsScreen extends StatelessWidget {
  const GreenhouseSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final greenhouse = SettingsService().getGreenhouse();

    return Scaffold(
      appBar: AppBar(title: const Text('Greenhouse')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${greenhouse.name}'),
            const SizedBox(height: 8),
            Text('Location: ${greenhouse.location}'),
            const SizedBox(height: 8),
            Text(
              'Mode: ${greenhouse.mode == GreenhouseMode.automatic ? 'Automatic' : 'Manual'}',
            ),
          ],
        ),
      ),
    );
  }
}
