import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_app/models/post_dto.dart';
import 'package:list_app/models/serializers.dart';

class PostsProvider extends ChangeNotifier {
  int _nowPage = 0;
  List<PostDto> _posts = [];

  UnmodifiableListView<PostDto> get posts => UnmodifiableListView(_posts);

  Future<void> fetchAndSetPosts() async {
    String url =
        'https://problem.comento.kr/api/list?page=0&ord=desc&limit=10&category[0]=1';
    final response = await http.get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    _nowPage = responseMap['current_page'];
    _posts = (responseMap['data'] as List<dynamic>)
        .map((dataMap) =>
            serializers.deserializeWith(PostDto.serializer, dataMap))
        .toList();
    notifyListeners();
  }

  Future<void> fetchAndSetNextPosts() async {
    String url =
        'https://problem.comento.kr/api/list?page=${_nowPage + 1}&ord=desc&limit=10&category[0]=1';
    final response = await http.get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    _nowPage = responseMap['current_page'];
    _posts.addAll((responseMap['data'] as List<dynamic>)
        .map((dataMap) =>
            serializers.deserializeWith(PostDto.serializer, dataMap))
        .toList());
    notifyListeners();
  }
}
