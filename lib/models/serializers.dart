import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:list_app/models/category_dto.dart';
import 'package:list_app/models/post_dto.dart';
import 'package:list_app/models/reply_dto.dart';
import 'package:list_app/models/user_dto.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  PostDto,
  UserDto,
  CategoryDto,
  ReplyDto,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
