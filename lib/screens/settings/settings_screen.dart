import 'package:flutter/material.dart';
import 'profile_settings_screen.dart';
import 'greenhouse_settings_screen.dart';
import 'plant_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SettingsTile(
            icon: Icons.person,
            title: 'Profile',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileSettingsScreen()),
            ),
          ),
          _SettingsTile(
            icon: Icons.home_work,
            title: 'Greenhouse',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const GreenhouseSettingsScreen()),
            ),
          ),
          _SettingsTile(
            icon: Icons.local_florist,
            title: 'Plants',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PlantSettingsScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
