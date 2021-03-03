library ads_dto;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:list_app/models/content_dto.dart';
import 'package:list_app/models/serializers.dart';

part 'ads_dto.g.dart';

abstract class AdsDto implements Built<AdsDto, AdsDtoBuilder>, ContentDto {
  AdsDto._();

  factory AdsDto([updates(AdsDtoBuilder b)]) = _$AdsDto;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'title')
  String get title;
  @BuiltValueField(wireName: 'contents')
  String get contents;
  @BuiltValueField(wireName: 'img')
  String get img;
  @BuiltValueField(wireName: 'created_at')
  String get createdAt;
  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;
  String toJson() {
    return json.encode(serializers.serializeWith(AdsDto.serializer, this));
  }

  static AdsDto fromJson(String jsonString) {
    return serializers.deserializeWith(
        AdsDto.serializer, json.decode(jsonString));
  }

  static Serializer<AdsDto> get serializer => _$adsDtoSerializer;
}
