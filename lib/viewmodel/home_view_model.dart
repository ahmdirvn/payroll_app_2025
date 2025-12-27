import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ntp/ntp.dart';

class HomeViewModel with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _name = "";
  String _token = "";
  String _greeting = "";
  bool _isLoading = false;

  // ====== GETTER ======
  String get name => _name;
  String get token => _token;
  String get greeting => _greeting;
  bool get isLoading => _isLoading;

  // ====== INIT ======
  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await _loadUserData();
    await _loadGreeting();

    _isLoading = false;
    notifyListeners();
  }

  // ====== SHARED PREF ======
  Future<void> _loadUserData() async {
    final prefs = await _prefs;
    _token = prefs.getString("token") ?? "";
    _name = prefs.getString("name") ?? "";
  }

  // ====== NETWORK TIME ======
  Future<DateTime> _getNetworkTime() async {
    try {
      return await NTP.now();
    } catch (e) {
      debugPrint('Error getting network time: $e');
      return DateTime.now();
    }
  }

  // ====== GREETING ======
  Future<void> _loadGreeting() async {
    DateTime currentTime = await _getNetworkTime();
    final hour = currentTime.hour;

    if (hour < 12) {
      _greeting = 'Good morning';
    } else if (hour < 17) {
      _greeting = 'Good afternoon';
    } else {
      _greeting = 'Good evening';
    }
  }
}
