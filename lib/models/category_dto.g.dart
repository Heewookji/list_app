// GENERATED CODE - DO NOT MODIFY BY HAND

part of category_dto;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryDto> _$categoryDtoSerializer = new _$CategoryDtoSerializer();

class _$CategoryDtoSerializer implements StructuredSerializer<CategoryDto> {
  @override
  final Iterable<Type> types = const [CategoryDto, _$CategoryDto];
  @override
  final String wireName = 'CategoryDto';

  @override
  Iterable<Object> serialize(Serializers serializers, CategoryDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CategoryDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryDto extends CategoryDto {
  @override
  final int id;
  @override
  final String name;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$CategoryDto([void Function(CategoryDtoBuilder) updates]) =>
      (new CategoryDtoBuilder()..update(updates)).build();

  _$CategoryDto._({this.id, this.name, this.createdAt, this.updatedAt})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('CategoryDto', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('CategoryDto', 'name');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('CategoryDto', 'createdAt');
    }
    if (updatedAt == null) {
      throw new BuiltValueNullFieldError('CategoryDto', 'updatedAt');
    }
  }

  @override
  CategoryDto rebuild(void Function(CategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryDtoBuilder toBuilder() => new CategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryDto &&
        id == other.id &&
        name == other.name &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), name.hashCode), createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoryDto')
          ..add('id', id)
          ..add('name', name)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class CategoryDtoBuilder implements Builder<CategoryDto, CategoryDtoBuilder> {
  _$CategoryDto _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  CategoryDtoBuilder();

  CategoryDtoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CategoryDto;
  }

  @override
  void update(void Function(CategoryDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoryDto build() {
    final _$result = _$v ??
        new _$CategoryDto._(
            id: id, name: name, createdAt: createdAt, updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
