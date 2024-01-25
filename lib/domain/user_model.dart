// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class User {
  final Id id;
  final String firstName;
  final String avatar;
  final String email;
  final String secondName;
  final String? password;
  final DateTime createdAt;
  User({
    required this.id,
    required this.firstName,
    required this.avatar,
    required this.email,
    required this.secondName,
    this.password,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'avatar': avatar,
      'email': email,
      'secondName': secondName,
      'password': password,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstName: map['firstName'] as String,
      avatar: map['avatar'] as String,
      email: map['email'] as String,
      secondName: map['secondName'] as String,
      password: map['password'] != null ? map['password'] as String : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
