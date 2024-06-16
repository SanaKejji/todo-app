// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) => LoginInfo(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };
