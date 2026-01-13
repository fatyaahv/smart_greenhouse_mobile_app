import '../models/sensor_data.dart';
import '../models/device_state.dart';
import '../models/notification_model.dart';

class DataService {
  static List<SensorData> getSensorData() {
    return [
      SensorData(name: 'Temperature', value: 26.5, unit: '°C'),
      SensorData(name: 'Humidity', value: 65, unit: '%'),
      SensorData(name: 'Soil Moisture', value: 40, unit: '%'),
    ];
  }

  static List<DeviceState> getDevices() {
    return [
      DeviceState(deviceName: 'Fan', isOn: true),
      DeviceState(deviceName: 'Water Pump', isOn: false),
      DeviceState(deviceName: 'Heater', isOn: false),
    ];
  }

  static List<NotificationModel> getNotifications() {
    return [
      NotificationModel(
        title: 'High Temperature',
        description: 'Temperature exceeded 30°C',
        time: DateTime.now(),
      ),
    ];
  }
}
