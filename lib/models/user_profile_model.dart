class UserProfile {
  final String id;
  final String name;
  final String email;
  final String phone;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserProfile.mock() {
    return UserProfile(
      id: 'user_1',
      name: 'Fatima',
      email: 'fatima@example.com',
      phone: '+90 555 000 0000',
    );
  }
}
