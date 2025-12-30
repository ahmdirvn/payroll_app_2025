import 'package:flutter/material.dart';
import 'package:payroll_app/view/pages/pages.dart';

class NavigatorViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  final List<Widget> tabs = const [HomePage(), ProfilePage()];

  void changeTab(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
