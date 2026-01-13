import 'package:flutter/material.dart';
import '../models/device_model.dart';
import '../services/firestore_service.dart';

class DeviceTile extends StatelessWidget {
  final DeviceModel device;
  final String label;
  final IconData icon;

  const DeviceTile({
    super.key,
    required this.device,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor:
                device.isOn ? const Color(0xFF6FBF8E) : Colors.grey.shade300,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Switch(
            value: device.isOn,
            activeThumbColor: const Color(0xFF6FBF8E),
            onChanged: (value) {
              FirestoreService().setDeviceState(device.id, value);
            },
          ),
        ],
      ),
    );
  }
}
