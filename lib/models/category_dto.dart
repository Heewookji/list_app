library category_dto;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:list_app/models/serializers.dart';

part 'category_dto.g.dart';

abstract class CategoryDto implements Built<CategoryDto, CategoryDtoBuilder> {
  CategoryDto._();

  factory CategoryDto([updates(CategoryDtoBuilder b)]) = _$CategoryDto;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'name')
  String get name;
  @BuiltValueField(wireName: 'created_at')
  String get createdAt;
  @BuiltValueField(wireName: 'updated_at')
  String get updatedAt;
  String toJson() {
    return json.encode(serializers.serializeWith(CategoryDto.serializer, this));
  }

  static CategoryDto fromJson(String jsonString) {
    return serializers.deserializeWith(
        CategoryDto.serializer, json.decode(jsonString));
  }

  static Serializer<CategoryDto> get serializer => _$categoryDtoSerializer;
}
