import 'package:flutter/material.dart';
import '../../services/settings_service.dart';

class PlantSettingsScreen extends StatelessWidget {
  const PlantSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plant = SettingsService().getPlant();

    return Scaffold(
      appBar: AppBar(title: const Text('Plant Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Plant: ${plant.name}'),
            const SizedBox(height: 8),
            Text('Temperature: ${plant.tempMin}°C – ${plant.tempMax}°C'),
            const SizedBox(height: 8),
            Text('Humidity: ${plant.humidityMin}% – ${plant.humidityMax}%'),
          ],
        ),
      ),
    );
  }
}
