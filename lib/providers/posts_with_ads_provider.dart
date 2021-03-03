import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:list_app/constants.dart';
import 'package:list_app/models/ads_dto.dart';
import 'package:list_app/models/content_dto.dart';
import 'package:list_app/models/post_dto.dart';
import 'package:list_app/models/serializers.dart';

enum Category {
  apple,
  banana,
  coconut,
}

class PostsWithAdsProvider extends ChangeNotifier {
  final Category _category;
  int _postCurrentPage = 0;
  int _adsCurrentPage = 0;
  List<PostDto> _posts = [];
  List<AdsDto> _ads = [];
  List<ContentDto> _contents = [];

  PostsWithAdsProvider(this._category);

  UnmodifiableListView<ContentDto> get contents =>
      UnmodifiableListView(_contents);

  Future<void> setContents() async {
    await _fetchAndSetPosts();
    await _fetchAndSetAds();
    _contents = _calculateContentList();
    notifyListeners();
  }

  Future<void> setNextContents() async {
    await _fetchAndSetNextPosts();
    await _fetchAndSetNextAdsByPostLength();
    _contents = _calculateContentList();
    notifyListeners();
  }

  List<ContentDto> _calculateContentList() {
    List<ContentDto> newContents = [];
    for (int i = 0;
        i < _posts.length + (_posts.length / Constants.adsInterval).floor();
        i++) {
      final adsCount = ((i + 1) / (Constants.adsInterval + 1)).floor();
      print('i : $i  postCount : ${i - adsCount}  adsCount : $adsCount ');
      if (i == 0 || (i + 1) % (Constants.adsInterval + 1) != 0) {
        newContents.add(_posts[i - adsCount]);
        continue;
      }
      newContents.add(_ads[adsCount - 1]);
    }
    return newContents;
  }

  Future<void> _fetchAndSetPosts() async {
    String url = 'https://problem.comento.kr/api/list?page=0'
        '&ord=desc&limit=${Constants.postLimit}'
        '&category[0]=${_category.index + 1}';
    final response = await http.get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    _postCurrentPage = responseMap['current_page'];
    _posts = await _getPostsWithDetail(responseMap['data']);
  }

  Future<void> _fetchAndSetAds() async {
    String url = 'https://problem.comento.kr/api/ads?page=0'
        '&limit=${Constants.adsLimit}';
    final response = await http.get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    _adsCurrentPage = responseMap['current_page'];
    _ads = (responseMap['data'] as List<dynamic>)
        .map((dataMap) =>
            serializers.deserializeWith(AdsDto.serializer, dataMap))
        .toList();
  }

  Future<void> _fetchAndSetNextPosts() async {
    String url =
        'https://problem.comento.kr/api/list?page=${_postCurrentPage + 1}'
        '&ord=desc&limit=${Constants.postLimit}'
        '&category[0]=${_category.index + 1}';
    final response = await http.get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    _postCurrentPage = responseMap['current_page'];
    _posts.addAll(await _getPostsWithDetail(responseMap['data']));
  }

  Future<void> _fetchAndSetNextAdsByPostLength() async {
    if ((_ads.length * Constants.adsInterval) >= _posts.length) return;
    String url =
        'https://problem.comento.kr/api/ads?page=${_adsCurrentPage + 1}'
        '&limit=${Constants.adsLimit}';
    final response = await http.get(url);
    Map<String, dynamic> responseMap = json.decode(response.body);
    _adsCurrentPage = responseMap['current_page'];
    _ads.addAll((responseMap['data'] as List<dynamic>)
        .map((dataMap) =>
            serializers.deserializeWith(AdsDto.serializer, dataMap))
        .toList());
    print('fetch ads!');
  }

  Future<List<PostDto>> _getPostsWithDetail(List<dynamic> dataMapList) async {
    return await Future.wait(dataMapList.map(
      (dataMap) async {
        String detailUrl =
            'https://problem.comento.kr/api/view?id=${dataMap['id']}';
        final detailResponse = await http.get(detailUrl);
        dynamic detailDataMap = json.decode(detailResponse.body)['data'];
        dataMap['category'] = detailDataMap['category'];
        dataMap['user'] = detailDataMap['user'];
        dataMap['reply'] = detailDataMap['reply'];
        return serializers.deserializeWith(PostDto.serializer, dataMap);
      },
    ).toList());
  }
}
