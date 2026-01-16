enum ActuatorType { fan, pump, heater }

class Actuator {
  final ActuatorType type;
  final String name;
  bool isOn;

  Actuator({
    required this.type,
    required this.name,
    this.isOn = false,
  });
}
