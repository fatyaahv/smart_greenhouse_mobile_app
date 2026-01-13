import 'package:cloud_firestore/cloud_firestore.dart';

class GreenhouseRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<double> temperatureStream() {
    return _firestore
        .collection('greenhouses')
        .doc('greenhouse_001')
        .collection('sensors')
        .doc('temperature')
        .snapshots()
        .map((doc) => (doc.data()?['value'] ?? 0).toDouble());
  }

  Stream<double> humidityStream() {
    return _firestore
        .collection('greenhouses')
        .doc('greenhouse_001')
        .collection('sensors')
        .doc('humidity')
        .snapshots()
        .map((doc) => (doc.data()?['value'] ?? 0).toDouble());
  }
}
