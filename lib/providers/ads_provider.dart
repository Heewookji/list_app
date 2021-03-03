import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:list_app/models/ads_dto.dart';

class AdsProvider extends ChangeNotifier {
  int _currentPage = 0;
  List<AdsDto> _ads = [];

  UnmodifiableListView<AdsDto> get ads => UnmodifiableListView(_ads);
}
