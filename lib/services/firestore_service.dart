import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // ===== SENSORS =====
  Stream<DocumentSnapshot> temperatureStream() {
    return _db
        .collection('greenhouses')
        .doc('greenhouse_001')
        .collection('sensors')
        .doc('temperature')
        .snapshots();
  }

  // ===== DEVICES =====
  Stream<DocumentSnapshot> deviceStream(String deviceId) {
    return _db
        .collection('greenhouses')
        .doc('greenhouse_001')
        .collection('devices')
        .doc(deviceId)
        .snapshots();
  }

  Future<void> setDeviceState(String deviceId, bool isOn) async {
    await _db
        .collection('greenhouses')
        .doc('greenhouse_001')
        .collection('devices')
        .doc(deviceId)
        .update({
      'isOn': isOn,
      'lastChanged': FieldValue.serverTimestamp(),
    });
  }
}
