import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_client_php_backend/models/User.dart';

part 'ApiRequest.g.dart';

@JsonSerializable()
class ApiRequest extends Object with _$ApiRequestSerializerMixin {
  String operation;
  User user;

  ApiRequest({this.operation, this.user});

  factory ApiRequest.fromJson(Map<String, dynamic> json) =>
      _$ApiRequestFromJson(json);
}
