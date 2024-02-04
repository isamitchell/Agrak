// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

part 'user_model.g.dart';

@collection
class User {
  final String id;
  Id get isarId => fastHash(id);
  final String firstName;
  final String avatar;
  final String email;
  final String secondName;
  final DateTime createdAt;

  User({
    required this.id,
    required this.createdAt,
    required this.firstName,
    required this.avatar,
    required this.email,
    required this.secondName,
  });

  User copyWith({
    String? id,
    DateTime? createdAt,
    String? firstName,
    String? avatar,
    String? email,
    String? secondName,
  }) {
    return User(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      firstName: firstName ?? this.firstName,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      secondName: secondName ?? this.secondName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'first_name': firstName,
      'avatar': avatar,
      'email': email,
      'second_name': secondName,
      'createdAt': createdAt.toUtc(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      firstName: map['first_name'] as String,
      avatar: map['avatar'] as String,
      email: map['email'] as String,
      secondName: map['second_name'] as String,
      createdAt: DateTime.parse(map['createdAt']), // Use the named parameter 'createdAt' here
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
