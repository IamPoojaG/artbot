import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.phoneNumber,
  });

  // Method to convert a User object to a map (useful for serialization)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatarUrl': avatarUrl,
      'phoneNumber': phoneNumber,
    };
  }

  // Method to create a User object from a map (useful for deserialization)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      avatarUrl: map['avatarUrl'],
      phoneNumber: map['phoneNumber'],
    );
  }

  // Method to create a User object from a JSON string
  factory User.fromJson(String source) {
    return User.fromMap(json.decode(source));
  }

  // Method to convert a User object to a JSON string
  String toJson() {
    return json.encode(toMap());
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, avatarUrl: $avatarUrl, phoneNumber: $phoneNumber}';
  }
}
