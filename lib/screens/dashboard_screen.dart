import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../services/firestore_service.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ================= HERO HEADER =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB7D6B9),
                      Color(0xFFDDEEDF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Good morning, Fatima 🌱',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2F5D50),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Live greenhouse status',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4F7C6E),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.eco,
                      size: 36,
                      color: Color(0xFF4F7C6E),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ================= CONTENT =================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Live Environment',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2F5D50),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔥 TEMPERATURE FROM FIRESTORE
                    StreamBuilder(
                      stream: FirestoreService().temperatureStream(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Padding(
                            padding: EdgeInsets.all(20),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        final data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        final double value =
                            (data['value'] as num).toDouble();

                        return _SensorChartCard(
                          title: 'Temperature',
                          value: '${value.toStringAsFixed(1)} °C',
                          spots: [
                            FlSpot(0, value - 2),
                            FlSpot(1, value - 1.5),
                            FlSpot(2, value - 1),
                            FlSpot(3, value - 0.5),
                            FlSpot(4, value),
                          ],
                          lineColor: const Color(0xFF7FB77E),
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    // 🌊 HUMIDITY (STATIC FOR NOW)
                    _SensorChartCard(
                      title: 'Humidity',
                      value: '63 %',
                      spots: const [
                        FlSpot(0, 55),
                        FlSpot(1, 57),
                        FlSpot(2, 58),
                        FlSpot(3, 60),
                        FlSpot(4, 63),
                      ],
                      lineColor: Color(0xFF8FB9A8),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= SENSOR CHART CARD =================

class _SensorChartCard extends StatelessWidget {
  final String title;
  final String value;
  final List<FlSpot> spots;
  final Color lineColor;

  const _SensorChartCard({
    required this.title,
    required this.value,
    required this.spots,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F8F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2F5D50),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F5D50),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 90,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    color: lineColor,
                    barWidth: 3,
                    belowBarData: BarAreaData(
                      show: true,
                      color: lineColor.withValues(alpha: .25),
                    ),
                    dotData: FlDotData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
