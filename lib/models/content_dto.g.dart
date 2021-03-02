// GENERATED CODE - DO NOT MODIFY BY HAND

part of content_dto;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContentDto> _$contentDtoSerializer = new _$ContentDtoSerializer();

class _$ContentDtoSerializer implements StructuredSerializer<ContentDto> {
  @override
  final Iterable<Type> types = const [ContentDto, _$ContentDto];
  @override
  final String wireName = 'ContentDto';

  @override
  Iterable<Object> serialize(Serializers serializers, ContentDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'contents',
      serializers.serialize(object.contents,
          specifiedType: const FullType(String)),
      'category_id',
      serializers.serialize(object.categoryId,
          specifiedType: const FullType(int)),
      'user_id',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
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
  ContentDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContentDtoBuilder();

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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contents':
          result.contents = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category_id':
          result.categoryId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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

class _$ContentDto extends ContentDto {
  @override
  final int id;
  @override
  final String title;
  @override
  final String contents;
  @override
  final int categoryId;
  @override
  final int userId;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$ContentDto([void Function(ContentDtoBuilder) updates]) =>
      (new ContentDtoBuilder()..update(updates)).build();

  _$ContentDto._(
      {this.id,
      this.title,
      this.contents,
      this.categoryId,
      this.userId,
      this.createdAt,
      this.updatedAt})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ContentDto', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('ContentDto', 'title');
    }
    if (contents == null) {
      throw new BuiltValueNullFieldError('ContentDto', 'contents');
    }
    if (categoryId == null) {
      throw new BuiltValueNullFieldError('ContentDto', 'categoryId');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('ContentDto', 'userId');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('ContentDto', 'createdAt');
    }
    if (updatedAt == null) {
      throw new BuiltValueNullFieldError('ContentDto', 'updatedAt');
    }
  }

  @override
  ContentDto rebuild(void Function(ContentDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentDtoBuilder toBuilder() => new ContentDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentDto &&
        id == other.id &&
        title == other.title &&
        contents == other.contents &&
        categoryId == other.categoryId &&
        userId == other.userId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), title.hashCode),
                        contents.hashCode),
                    categoryId.hashCode),
                userId.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ContentDto')
          ..add('id', id)
          ..add('title', title)
          ..add('contents', contents)
          ..add('categoryId', categoryId)
          ..add('userId', userId)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ContentDtoBuilder implements Builder<ContentDto, ContentDtoBuilder> {
  _$ContentDto _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _contents;
  String get contents => _$this._contents;
  set contents(String contents) => _$this._contents = contents;

  int _categoryId;
  int get categoryId => _$this._categoryId;
  set categoryId(int categoryId) => _$this._categoryId = categoryId;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  ContentDtoBuilder();

  ContentDtoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _contents = _$v.contents;
      _categoryId = _$v.categoryId;
      _userId = _$v.userId;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ContentDto;
  }

  @override
  void update(void Function(ContentDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ContentDto build() {
    final _$result = _$v ??
        new _$ContentDto._(
            id: id,
            title: title,
            contents: contents,
            categoryId: categoryId,
            userId: userId,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
