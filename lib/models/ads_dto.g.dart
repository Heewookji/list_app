// GENERATED CODE - DO NOT MODIFY BY HAND

part of ads_dto;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AdsDto> _$adsDtoSerializer = new _$AdsDtoSerializer();

class _$AdsDtoSerializer implements StructuredSerializer<AdsDto> {
  @override
  final Iterable<Type> types = const [AdsDto, _$AdsDto];
  @override
  final String wireName = 'AdsDto';

  @override
  Iterable<Object> serialize(Serializers serializers, AdsDto object,
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
      'img',
      serializers.serialize(object.img, specifiedType: const FullType(String)),
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
  AdsDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AdsDtoBuilder();

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
        case 'img':
          result.img = serializers.deserialize(value,
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

class _$AdsDto extends AdsDto {
  @override
  final int id;
  @override
  final String title;
  @override
  final String contents;
  @override
  final String img;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  factory _$AdsDto([void Function(AdsDtoBuilder) updates]) =>
      (new AdsDtoBuilder()..update(updates)).build();

  _$AdsDto._(
      {this.id,
      this.title,
      this.contents,
      this.img,
      this.createdAt,
      this.updatedAt})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('AdsDto', 'id');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('AdsDto', 'title');
    }
    if (contents == null) {
      throw new BuiltValueNullFieldError('AdsDto', 'contents');
    }
    if (img == null) {
      throw new BuiltValueNullFieldError('AdsDto', 'img');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError('AdsDto', 'createdAt');
    }
    if (updatedAt == null) {
      throw new BuiltValueNullFieldError('AdsDto', 'updatedAt');
    }
  }

  @override
  AdsDto rebuild(void Function(AdsDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AdsDtoBuilder toBuilder() => new AdsDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdsDto &&
        id == other.id &&
        title == other.title &&
        contents == other.contents &&
        img == other.img &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, id.hashCode), title.hashCode),
                    contents.hashCode),
                img.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AdsDto')
          ..add('id', id)
          ..add('title', title)
          ..add('contents', contents)
          ..add('img', img)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class AdsDtoBuilder implements Builder<AdsDto, AdsDtoBuilder> {
  _$AdsDto _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _contents;
  String get contents => _$this._contents;
  set contents(String contents) => _$this._contents = contents;

  String _img;
  String get img => _$this._img;
  set img(String img) => _$this._img = img;

  String _createdAt;
  String get createdAt => _$this._createdAt;
  set createdAt(String createdAt) => _$this._createdAt = createdAt;

  String _updatedAt;
  String get updatedAt => _$this._updatedAt;
  set updatedAt(String updatedAt) => _$this._updatedAt = updatedAt;

  AdsDtoBuilder();

  AdsDtoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _title = _$v.title;
      _contents = _$v.contents;
      _img = _$v.img;
      _createdAt = _$v.createdAt;
      _updatedAt = _$v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdsDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AdsDto;
  }

  @override
  void update(void Function(AdsDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AdsDto build() {
    final _$result = _$v ??
        new _$AdsDto._(
            id: id,
            title: title,
            contents: contents,
            img: img,
            createdAt: createdAt,
            updatedAt: updatedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
