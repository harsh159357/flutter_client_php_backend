import 'user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse  extends Object with _$ApiResponseSerializerMixin {
  String result;
  String message;
  User user;

  ApiResponse({this.result, this.message, this.user});

  factory ApiResponse.fromJson(Map<String,dynamic> json)=>_$ApiResponseFromJson(json);

}
