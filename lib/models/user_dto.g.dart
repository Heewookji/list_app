// GENERATED CODE - DO NOT MODIFY BY HAND

part of user_dto;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserDto> _$userDtoSerializer = new _$UserDtoSerializer();

class _$UserDtoSerializer implements StructuredSerializer<UserDto> {
  @override
  final Iterable<Type> types = const [UserDto, _$UserDto];
  @override
  final String wireName = 'UserDto';

  @override
  Iterable<Object> serialize(Serializers serializers, UserDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'email_verified_at',
      serializers.serialize(object.emailVerifiedAt,
          specifiedType: const FullType(String)),
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
  UserDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDtoBuilder();

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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email_verified_at':
          result.emailVerifiedAt = serializers.deserialize(value,
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

class _$UserDto extends UserDto {
  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String emailVerifiedAt;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$UserDto([void Function(UserDtoBuilder) updates]) =>
      (new UserDtoBuilder()..update(updates)).build();

  _$UserDto._(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('UserDto', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('UserDto', 'name');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('UserDto', 'email');
    }
    if (emailVerifiedAt == null) {
      throw new BuiltValueNullFieldError('UserDto', 'emailVerifiedAt');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('UserDto', 'createdAt');
    }
    if (updatedAt == null) {
      throw new BuiltValueNullFieldError('UserDto', 'updatedAt');
    }
  }

  @override
  UserDto rebuild(void Function(UserDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDtoBuilder toBuilder() => new UserDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDto &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        emailVerifiedAt == other.emailVerifiedAt &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), email.hashCode),
                emailVerifiedAt.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserDto')
          ..add('id', id)
          ..add('name', name)
          ..add('email', email)
          ..add('emailVerifiedAt', emailVerifiedAt)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class UserDtoBuilder implements Builder<UserDto, UserDtoBuilder> {
  _$UserDto _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _emailVerifiedAt;
  String get emailVerifiedAt => _$this._emailVerifiedAt;
  set emailVerifiedAt(String emailVerifiedAt) =>
      _$this._emailVerifiedAt = emailVerifiedAt;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  UserDtoBuilder();

  UserDtoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _email = _$v.email;
      _emailVerifiedAt = _$v.emailVerifiedAt;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserDto;
  }

  @override
  void update(void Function(UserDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserDto build() {
    final _$result = _$v ??
        new _$UserDto._(
            id: id,
            name: name,
            email: email,
            emailVerifiedAt: emailVerifiedAt,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
