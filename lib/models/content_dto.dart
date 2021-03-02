library content_dto;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:list_app/models/serializers.dart';

part 'content_dto.g.dart';

abstract class ContentDto implements Built<ContentDto, ContentDtoBuilder> {
  ContentDto._();

  factory ContentDto([updates(ContentDtoBuilder b)]) = _$ContentDto;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'title')
  String get title;
  @BuiltValueField(wireName: 'contents')
  String get contents;
  @BuiltValueField(wireName: 'category_id')
  int get categoryId;
  @BuiltValueField(wireName: 'user_id')
  int get userId;
  @BuiltValueField(wireName: 'created_at')
  String get createdAt;
  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;
  String toJson() {
    return json.encode(serializers.serializeWith(ContentDto.serializer, this));
  }

  static ContentDto fromJson(String jsonString) {
    return serializers.deserializeWith(
        ContentDto.serializer, json.decode(jsonString));
  }

  static Serializer<ContentDto> get serializer => _$contentDtoSerializer;
}
