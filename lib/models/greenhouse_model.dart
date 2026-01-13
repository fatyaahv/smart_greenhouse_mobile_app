enum GreenhouseMode { manual, automatic }

class Greenhouse {
  final String id;
  final String name;
  final String location;
  final GreenhouseMode mode;

  Greenhouse({
    required this.id,
    required this.name,
    required this.location,
    required this.mode,
  });

  factory Greenhouse.mock() {
    return Greenhouse(
      id: 'gh_1',
      name: 'Main Greenhouse',
      location: 'Istanbul',
      mode: GreenhouseMode.automatic,
    );
  }
}
