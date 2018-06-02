// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiResponse.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => new ApiResponse(
    result: json['result'] as String,
    message: json['message'] as String,
    user: json['user'] == null
        ? null
        : new User.fromJson(json['user'] as Map<String, dynamic>));

abstract class _$ApiResponseSerializerMixin {
  String get result;

  String get message;

  User get user;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'result': result, 'message': message, 'user': user};
}
