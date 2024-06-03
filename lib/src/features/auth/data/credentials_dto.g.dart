// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CredentialsDTOImpl _$$CredentialsDTOImplFromJson(Map<String, dynamic> json) =>
    _$CredentialsDTOImpl(
      admin: json['admin'] == null
          ? null
          : UserDTO.fromJson(json['admin'] as Map<String, dynamic>),
      adminSessionId: json['admin_session_id'] as String,
      accessToken: json['access_token'] as String,
      accessExpiration:
          DateTime.parse(json['access_token_expires_at'] as String),
      refreshToken: json['refresh_token'] as String?,
      refreshExpiration: json['refresh_token_expires_at'] == null
          ? null
          : DateTime.parse(json['refresh_token_expires_at'] as String),
    );

Map<String, dynamic> _$$CredentialsDTOImplToJson(
        _$CredentialsDTOImpl instance) =>
    <String, dynamic>{
      'admin': instance.admin?.toJson(),
      'admin_session_id': instance.adminSessionId,
      'access_token': instance.accessToken,
      'access_token_expires_at': instance.accessExpiration.toIso8601String(),
      'refresh_token': instance.refreshToken,
      'refresh_token_expires_at': instance.refreshExpiration?.toIso8601String(),
    };
