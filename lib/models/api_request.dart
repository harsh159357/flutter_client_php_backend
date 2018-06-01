import 'user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_request.g.dart';

@JsonSerializable()
class ApiRequest  extends Object with _$ApiRequestSerializerMixin {
  String operation;
  User user;

  ApiRequest({this.operation, this.user});

  factory ApiRequest.fromJson(Map<String,dynamic> json)=>_$ApiRequestFromJson(json);

}
