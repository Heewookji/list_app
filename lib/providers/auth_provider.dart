import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String _userId;
  DateTime _expiryDate;
  Timer _authTimer;

  bool get isAuth => userId != null;

  String get userId {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _userId != null) {
      return _userId;
    }
    return null;
  }

  Future<void> login(String userId) async {
    await Future.delayed(Duration(seconds: 1));
    _userId = userId;
    _expiryDate = DateTime.now().add(
      Duration(seconds: 60),
    );
    _setAutoLogoutTimer();
    notifyListeners();
    //device storage에서 data 가져옴
    final prefs = await SharedPreferences.getInstance();
    final userData = json.encode(
      {'userId': _userId, 'expiryDate': _expiryDate.toIso8601String()},
    );
    prefs.setString('userData', userData);
  }

  Future<void> logout() async {
    _userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    prefs.clear();
  }

  Future<bool> autoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) return false;
    final Map<String, Object> extractedUserData = json.decode(
      prefs.getString('userData'),
    );
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) return false;
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _setAutoLogoutTimer();
    return true;
  }

  void _setAutoLogoutTimer() {
    if (_authTimer != null) _authTimer.cancel();
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
