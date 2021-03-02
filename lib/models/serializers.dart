import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:list_app/models/content_dto.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ContentDto,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
