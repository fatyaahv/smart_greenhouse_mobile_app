import '../models/user_profile_model.dart';
import '../models/greenhouse_model.dart';
import '../models/plant_model.dart';

class SettingsService {
  static final SettingsService _instance = SettingsService._internal();
  factory SettingsService() => _instance;
  SettingsService._internal();

  UserProfile getUserProfile() {
    return UserProfile.mock();
  }

  Greenhouse getGreenhouse() {
    return Greenhouse.mock();
  }

  Plant getPlant() {
    return Plant.mock();
  }
}
