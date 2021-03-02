library post_dto;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:list_app/models/serializers.dart';

part 'post_dto.g.dart';

abstract class PostDto implements Built<PostDto, PostDtoBuilder> {
  PostDto._();

  factory PostDto([updates(PostDtoBuilder b)]) = _$PostDto;

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
    return json.encode(serializers.serializeWith(PostDto.serializer, this));
  }

  static PostDto fromJson(String jsonString) {
    return serializers.deserializeWith(
        PostDto.serializer, json.decode(jsonString));
  }

  static Serializer<PostDto> get serializer => _$postDtoSerializer;
}
