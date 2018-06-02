// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => new User(
    name: json['name'] as String,
    email: json['email'] as String,
    unique_id: json['unique_id'] as String,
    password: json['password'] as String,
    old_password: json['old_password'] as String,
    new_password: json['new_password'] as String);

abstract class _$UserSerializerMixin {
  String get name;

  String get email;

  String get unique_id;

  String get password;

  String get old_password;

  String get new_password;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
        'unique_id': unique_id,
        'password': password,
        'old_password': old_password,
        'new_password': new_password
      };
}
