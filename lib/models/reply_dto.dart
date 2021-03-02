library reply_dto;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:list_app/models/serializers.dart';
import 'package:list_app/models/user_dto.dart';

part 'reply_dto.g.dart';

abstract class ReplyDto implements Built<ReplyDto, ReplyDtoBuilder> {
  ReplyDto._();

  factory ReplyDto([updates(ReplyDtoBuilder b)]) = _$ReplyDto;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'user_id')
  int get userId;
  @BuiltValueField(wireName: 'parent')
  int get parent;
  @BuiltValueField(wireName: 'contents')
  String get contents;
  @BuiltValueField(wireName: 'created_at')
  String get createdAt;
  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;
  @BuiltValueField(wireName: 'user')
  UserDto get user;
  String toJson() {
    return json.encode(serializers.serializeWith(ReplyDto.serializer, this));
  }

  static ReplyDto fromJson(String jsonString) {
    return serializers.deserializeWith(
        ReplyDto.serializer, json.decode(jsonString));
  }

  static Serializer<ReplyDto> get serializer => _$replyDtoSerializer;
}
