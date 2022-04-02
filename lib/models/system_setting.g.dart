// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemSetting _$SystemSettingFromJson(Map<String, dynamic> json) =>
    SystemSetting(
      language: json['language'] as String? ?? "vi",
      theme: json['theme'] as String? ?? "Light",
    );

Map<String, dynamic> _$SystemSettingToJson(SystemSetting instance) =>
    <String, dynamic>{
      'language': instance.language,
      'theme': instance.theme,
    };
