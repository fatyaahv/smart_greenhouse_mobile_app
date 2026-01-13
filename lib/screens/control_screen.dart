import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/device_model.dart';
//import '../services/firestore_service.dart';
import '../widgets/device_tile.dart';

class ControlScreen extends StatelessWidget {
  const ControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Control')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('greenhouses')
            .doc('greenhouse_001')
            .collection('devices')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final devices = snapshot.data!.docs
              .map((doc) => DeviceModel.fromMap(
                    doc.id,
                    doc.data() as Map<String, dynamic>,
                  ))
              .toList();

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: devices.map((device) {
                return DeviceTile(
                  device: device,
                  label: _labelForDevice(device.id),
                  icon: _iconForDevice(device.id),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

  String _labelForDevice(String id) {
    switch (id) {
      case 'fan':
        return 'Ventilation Fan';
      case 'water_pump':
        return 'Water Pump';
      case 'heater':
        return 'Heater';
      default:
        return id;
    }
  }

  IconData _iconForDevice(String id) {
    switch (id) {
      case 'fan':
        return Icons.air;
      case 'water_pump':
        return Icons.water_drop;
      case 'heater':
        return Icons.local_fire_department;
      default:
        return Icons.device_unknown;
    }
  }
}
