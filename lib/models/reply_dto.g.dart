// GENERATED CODE - DO NOT MODIFY BY HAND

part of reply_dto;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReplyDto> _$replyDtoSerializer = new _$ReplyDtoSerializer();

class _$ReplyDtoSerializer implements StructuredSerializer<ReplyDto> {
  @override
  final Iterable<Type> types = const [ReplyDto, _$ReplyDto];
  @override
  final String wireName = 'ReplyDto';

  @override
  Iterable<Object> serialize(Serializers serializers, ReplyDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'user_id',
      serializers.serialize(object.userId, specifiedType: const FullType(int)),
      'parent',
      serializers.serialize(object.parent, specifiedType: const FullType(int)),
      'contents',
      serializers.serialize(object.contents,
          specifiedType: const FullType(String)),
      'created_at',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(String)),
      'updated_at',
      serializers.serialize(object.updatedAt,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user,
          specifiedType: const FullType(UserDto)),
    ];

    return result;
  }

  @override
  ReplyDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReplyDtoBuilder();

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
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'parent':
          result.parent = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'contents':
          result.contents = serializers.deserialize(value,
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
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserDto)) as UserDto);
          break;
      }
    }

    return result.build();
  }
}

class _$ReplyDto extends ReplyDto {
  @override
  final int id;
  @override
  final int userId;
  @override
  final int parent;
  @override
  final String contents;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final UserDto user;

  factory _$ReplyDto([void Function(ReplyDtoBuilder) updates]) =>
      (new ReplyDtoBuilder()..update(updates)).build();

  _$ReplyDto._(
      {this.id,
      this.userId,
      this.parent,
      this.contents,
      this.createdAt,
      this.updatedAt,
      this.user})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ReplyDto', 'id');
    }
    if (userId == null) {
      throw new BuiltValueNullFieldError('ReplyDto', 'userId');
    }
    if (parent == null) {
      throw new BuiltValueNullFieldError('ReplyDto', 'parent');
    }
    if (contents == null) {
      throw new BuiltValueNullFieldError('ReplyDto', 'contents');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('ReplyDto', 'createdAt');
    }
    if (updatedAt == null) {
      throw new BuiltValueNullFieldError('ReplyDto', 'updatedAt');
    }
    if (user == null) {
      throw new BuiltValueNullFieldError('ReplyDto', 'user');
    }
  }

  @override
  ReplyDto rebuild(void Function(ReplyDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplyDtoBuilder toBuilder() => new ReplyDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReplyDto &&
        id == other.id &&
        userId == other.userId &&
        parent == other.parent &&
        contents == other.contents &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), userId.hashCode),
                        parent.hashCode),
                    contents.hashCode),
                createdAt.hashCode),
            updatedAt.hashCode),
        user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReplyDto')
          ..add('id', id)
          ..add('userId', userId)
          ..add('parent', parent)
          ..add('contents', contents)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt)
          ..add('user', user))
        .toString();
  }
}

class ReplyDtoBuilder implements Builder<ReplyDto, ReplyDtoBuilder> {
  _$ReplyDto _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  int _parent;
  int get parent => _$this._parent;
  set parent(int parent) => _$this._parent = parent;

  String _contents;
  String get contents => _$this._contents;
  set contents(String contents) => _$this._contents = contents;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  UserDtoBuilder _user;
  UserDtoBuilder get user => _$this._user ??= new UserDtoBuilder();
  set user(UserDtoBuilder user) => _$this._user = user;

  ReplyDtoBuilder();

  ReplyDtoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _userId = _$v.userId;
      _parent = _$v.parent;
      _contents = _$v.contents;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReplyDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReplyDto;
  }

  @override
  void update(void Function(ReplyDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReplyDto build() {
    _$ReplyDto _$result;
    try {
      _$result = _$v ??
          new _$ReplyDto._(
              id: id,
              userId: userId,
              parent: parent,
              contents: contents,
              createdAt: createdAt,
              updatedAt: updatedAt,
              user: user.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ReplyDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
