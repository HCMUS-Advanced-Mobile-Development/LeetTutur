import 'package:json_annotation/json_annotation.dart';
import 'package:leet_tutur/models/tokens.dart';
import 'package:leet_tutur/models/user.dart';

part 'auth_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthResponse {
    User? user;
    Tokens? tokens;

    AuthResponse({this.user, this.tokens});

    factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);

    Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}