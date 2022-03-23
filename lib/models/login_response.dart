import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/tokens.dart';
import 'package:leet_tutur/models/user.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
    User? user;
    Tokens? tokens;

    LoginResponse({this.user, this.tokens});

    factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

    Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}