import 'package:json_annotation/json_annotation.dart';

part 'system_setting.g.dart';

@JsonSerializable(explicitToJson: true)
class SystemSetting {
    String? language;
    String? theme;
    SystemSetting({this.language = "vi", this.theme = "light"});

    factory SystemSetting.fromJson(Map<String, dynamic> json) => _$SystemSettingFromJson(json);

    Map<String, dynamic> toJson() => _$SystemSettingToJson(this);
}