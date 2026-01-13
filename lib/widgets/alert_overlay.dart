import 'package:flutter/material.dart';
import '../services/alert_service.dart';
import '../models/alert_model.dart';
import 'alert_banner.dart';

class AlertOverlay extends StatelessWidget {
  final Widget child;

  const AlertOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        StreamBuilder<AlertModel?>(
          stream: AlertService().alertStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const SizedBox();
            return Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AlertBanner(alert: snapshot.data!),
            );
          },
        ),
      ],
    );
  }
}
