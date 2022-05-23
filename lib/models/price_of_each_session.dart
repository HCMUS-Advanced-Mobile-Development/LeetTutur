import 'package:json_annotation/json_annotation.dart';

part 'price_of_each_session.g.dart';

@JsonSerializable(explicitToJson: true)
class PriceOfEachSession {
  String? id;
  String? key;
  String? price;
  String? createdAt;
  String? updatedAt;

  PriceOfEachSession(
      {this.id, this.key, this.price, this.createdAt, this.updatedAt});

  factory PriceOfEachSession.fromJson(Map<String, dynamic> json) =>
      _$PriceOfEachSessionFromJson(json);

  Map<String, dynamic> toJson() => _$PriceOfEachSessionToJson(this);
}