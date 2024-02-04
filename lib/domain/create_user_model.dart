// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateUser {
  final String firstName;
  final String avatar;
  final String email;
  final String secondName;
  CreateUser({
    required this.firstName,
    required this.avatar,
    required this.email,
    required this.secondName,
  });

  CreateUser copyWith({
    String? firstName,
    String? avatar,
    String? email,
    String? secondName,
  }) {
    return CreateUser(
      firstName: firstName ?? this.firstName,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      secondName: secondName ?? this.secondName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': firstName,
      'avatar': avatar,
      'email': email,
      'second_name': secondName,
    };
  }

  factory CreateUser.fromMap(Map<String, dynamic> map) {
    return CreateUser(
      firstName: map['first_name'] as String,
      avatar: map['avatar'] as String,
      email: map['email'] as String,
      secondName: map['second_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateUser.fromJson(String source) => CreateUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateUser(first_name: $firstName, avatar: $avatar, email: $email, second_name: $secondName)';
  }

  @override
  bool operator ==(covariant CreateUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.avatar == avatar &&
      other.email == email &&
      other.secondName == secondName;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      avatar.hashCode ^
      email.hashCode ^
      secondName.hashCode;
  }
}


