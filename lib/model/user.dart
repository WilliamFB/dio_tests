import 'dart:convert';

import 'user_type.dart';

class User {
  String id;
  String name;
  String username;
  List<UserType> types;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.types,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      types: List<UserType>.from(map['types']?.map((x) => UserType.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
