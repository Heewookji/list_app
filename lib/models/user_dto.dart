library user_dto;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:list_app/models/serializers.dart';

part 'user_dto.g.dart';

abstract class UserDto implements Built<UserDto, UserDtoBuilder> {
  UserDto._();

  factory UserDto([updates(UserDtoBuilder b)]) = _$UserDto;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'email')
  String get email;
  @BuiltValueField(wireName: 'email_verified_at')
  String get emailVerifiedAt;
  @BuiltValueField(wireName: 'created_at')
  String get createdAt;
  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;
  String toJson() {
    return json.encode(serializers.serializeWith(UserDto.serializer, this));
  }

  static UserDto fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserDto.serializer, json.decode(jsonString));
  }

  static Serializer<UserDto> get serializer => _$userDtoSerializer;
}
