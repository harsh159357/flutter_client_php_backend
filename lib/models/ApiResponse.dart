import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_client_php_backend/models/User.dart';

part 'ApiResponse.g.dart';

@JsonSerializable()
class ApiResponse extends Object with _$ApiResponseSerializerMixin {
  String result;
  String message;
  User user;

  ApiResponse({this.result, this.message, this.user});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
