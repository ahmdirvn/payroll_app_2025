import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ntp/ntp.dart';

class HomeViewModel extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _name = "";
  String _token = "";
  String _greeting = "";
  bool _isLoading = false;

  String get name => _name;
  String get token => _token;
  String get greeting => _greeting;
  bool get isLoading => _isLoading;

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await _loadUser();
    await _loadGreeting();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> _loadUser() async {
    final prefs = await _prefs;
    _name = prefs.getString("name") ?? "";
    _token = prefs.getString("token") ?? "";
  }

  Future<void> _loadGreeting() async {
    DateTime now;
    try {
      now = await NTP.now();
    } catch (_) {
      now = DateTime.now();
    }

    final hour = now.hour;
    if (hour < 12) {
      _greeting = "Good morning";
    } else if (hour < 17) {
      _greeting = "Good afternoon";
    } else {
      _greeting = "Good evening";
    }
  }
}
