// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiRequest.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiRequest _$ApiRequestFromJson(Map<String, dynamic> json) => new ApiRequest(
    operation: json['operation'] as String,
    user: json['user'] == null
        ? null
        : new User.fromJson(json['user'] as Map<String, dynamic>));

abstract class _$ApiRequestSerializerMixin {
  String get operation;

  User get user;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'operation': operation, 'user': user};
}
