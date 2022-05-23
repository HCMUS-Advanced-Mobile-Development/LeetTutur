// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_of_each_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceOfEachSession _$PriceOfEachSessionFromJson(Map<String, dynamic> json) =>
    PriceOfEachSession(
      id: json['id'] as String?,
      key: json['key'] as String?,
      price: json['price'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$PriceOfEachSessionToJson(PriceOfEachSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
