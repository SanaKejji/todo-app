import 'package:json_annotation/json_annotation.dart';
part 'login_info.g.dart';

@JsonSerializable()
class LoginInfo {
  final int? id;
  final String token;
  final String refreshToken;

  LoginInfo({required this.token, required this.refreshToken, this.id});

  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);

  LoginInfo copyWith({
    int? id,
    String? token,
    String? refreshToken,
  }) {
    return LoginInfo(
      id: id ?? this.id,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
