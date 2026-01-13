import 'package:flutter/material.dart';
import '../models/device_state.dart';

class ControlCard extends StatefulWidget {
  final DeviceState device;

  const ControlCard({super.key, required this.device});

  @override
  State<ControlCard> createState() => _ControlCardState();
}

class _ControlCardState extends State<ControlCard> {
  @override
  Widget build(BuildContext context) {
    final bool isOn = widget.device.isOn;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: isOn
            ? const LinearGradient(
                colors: [
                  Color(0xFFDDEEDF),
                  Color(0xFFB7D6B9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : const LinearGradient(
                colors: [
                  Color(0xFFF1F4F3),
                  Color(0xFFE4ECE9),
                ],
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          _deviceIcon(isOn),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.device.deviceName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2F5D50),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isOn ? 'Active' : 'Inactive',
                  style: TextStyle(
                    fontSize: 13,
                    color: isOn
                        ? const Color(0xFF3A7D6A)
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          Switch(
            value: isOn,
            activeThumbColor: const Color(0xFF7FB77E),
            onChanged: (value) {
              setState(() {
                widget.device.isOn = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _deviceIcon(bool isOn) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isOn
            ? const Color(0xFF7FB77E)
            : Colors.grey.shade300,
      ),
      child: Icon(
        Icons.power_settings_new,
        color: Colors.white,
        size: 22,
      ),
    );
  }
}
