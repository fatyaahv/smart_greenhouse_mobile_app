class DeviceModel {
  final String id;
  final bool isOn;
  final String mode;

  DeviceModel({
    required this.id,
    required this.isOn,
    required this.mode,
  });

  factory DeviceModel.fromMap(String id, Map<String, dynamic> data) {
    return DeviceModel(
      id: id,
      isOn: data['isOn'] ?? false,
      mode: data['mode'] ?? 'manual',
    );
  }
}
