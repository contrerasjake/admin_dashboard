// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      id: json['Id'] as int,
      username: json['Username'] as String,
      name: json['Name'] as String,
      email: json['Email'] as String,
      isActive: json['IsActive'] as bool,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      modifiedDate: json['ModifiedDate'] == null
          ? null
          : DateTime.parse(json['ModifiedDate'] as String),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Username': instance.username,
      'Name': instance.name,
      'Email': instance.email,
      'IsActive': instance.isActive,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'ModifiedDate': instance.modifiedDate?.toIso8601String(),
    };
