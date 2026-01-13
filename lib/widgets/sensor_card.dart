import 'package:flutter/material.dart';
import '../models/sensor_data.dart';

class SensorCard extends StatelessWidget {
  final SensorData sensor;

  const SensorCard({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(sensor.name),
        trailing: Text('${sensor.value} ${sensor.unit}'),
      ),
    );
  }
}
