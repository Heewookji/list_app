// GENERATED CODE - DO NOT MODIFY BY HAND

part of post_dto;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostDto> _$postDtoSerializer = new _$PostDtoSerializer();

class _$PostDtoSerializer implements StructuredSerializer<PostDto> {
  @override
  final Iterable<Type> types = const [PostDto, _$PostDto];
  @override
  final String wireName = 'PostDto';

  @override
  Iterable<Object> serialize(Serializers serializers, PostDto object,
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
      'category',
      serializers.serialize(object.category,
          specifiedType: const FullType(CategoryDto)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(UserDto)),
      'reply',
      serializers.serialize(object.reply,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ReplyDto)])),
    ];

    return result;
  }

  @override
  PostDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostDtoBuilder();

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
        case 'category':
          result.category.replace(serializers.deserialize(value,
              specifiedType: const FullType(CategoryDto)) as CategoryDto);
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'updated_at':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserDto)) as UserDto);
          break;
        case 'reply':
          result.reply.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ReplyDto)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$PostDto extends PostDto {
  @override
  final int id;
  @override
  final String title;
  @override
  final String contents;
  @override
  final CategoryDto category;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final UserDto user;
  @override
  final BuiltList<ReplyDto> reply;

  factory _$PostDto([void Function(PostDtoBuilder) updates]) =>
      (new PostDtoBuilder()..update(updates)).build();

  _$PostDto._(
      {this.id,
      this.title,
      this.contents,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.reply})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('PostDto', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('PostDto', 'title');
    }
    if (contents == null) {
      throw new BuiltValueNullFieldError('PostDto', 'contents');
    }
    if (category == null) {
      throw new BuiltValueNullFieldError('PostDto', 'category');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('PostDto', 'createdAt');
    }
    if (updatedAt == null) {
      throw new BuiltValueNullFieldError('PostDto', 'updatedAt');
    }
    if (user == null) {
      throw new BuiltValueNullFieldError('PostDto', 'user');
    }
    if (reply == null) {
      throw new BuiltValueNullFieldError('PostDto', 'reply');
    }
  }

  @override
  PostDto rebuild(void Function(PostDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostDtoBuilder toBuilder() => new PostDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostDto &&
        id == other.id &&
        title == other.title &&
        contents == other.contents &&
        category == other.category &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        user == other.user &&
        reply == other.reply;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, id.hashCode), title.hashCode),
                            contents.hashCode),
                        category.hashCode),
                    createdAt.hashCode),
                updatedAt.hashCode),
            user.hashCode),
        reply.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PostDto')
          ..add('id', id)
          ..add('title', title)
          ..add('contents', contents)
          ..add('category', category)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('user', user)
          ..add('reply', reply))
        .toString();
  }
}

class PostDtoBuilder implements Builder<PostDto, PostDtoBuilder> {
  _$PostDto _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _contents;
  String get contents => _$this._contents;
  set contents(String contents) => _$this._contents = contents;

  CategoryDtoBuilder _category;
  CategoryDtoBuilder get category =>
      _$this._category ??= new CategoryDtoBuilder();
  set category(CategoryDtoBuilder category) => _$this._category = category;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  UserDtoBuilder _user;
  UserDtoBuilder get user => _$this._user ??= new UserDtoBuilder();
  set user(UserDtoBuilder user) => _$this._user = user;

  ListBuilder<ReplyDto> _reply;
  ListBuilder<ReplyDto> get reply =>
      _$this._reply ??= new ListBuilder<ReplyDto>();
  set reply(ListBuilder<ReplyDto> reply) => _$this._reply = reply;

  PostDtoBuilder();

  PostDtoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _contents = _$v.contents;
      _category = _$v.category?.toBuilder();
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _user = _$v.user?.toBuilder();
      _reply = _$v.reply?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PostDto;
  }

  @override
  void update(void Function(PostDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PostDto build() {
    _$PostDto _$result;
    try {
      _$result = _$v ??
          new _$PostDto._(
              id: id,
              title: title,
              contents: contents,
              category: category.build(),
              createdAt: createdAt,
              updatedAt: updatedAt,
              user: user.build(),
              reply: reply.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'category';
        category.build();

        _$failedField = 'user';
        user.build();
        _$failedField = 'reply';
        reply.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PostDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
