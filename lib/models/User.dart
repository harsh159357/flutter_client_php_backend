import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User extends Object with _$UserSerializerMixin {
  String name;
  String email;
  String unique_id;
  String password;
  String old_password;
  String new_password;

  User(
      {this.name,
      this.email,
      this.unique_id,
      this.password,
      this.old_password,
      this.new_password});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
