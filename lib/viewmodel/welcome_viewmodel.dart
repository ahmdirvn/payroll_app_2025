import 'package:flutter/material.dart';
import 'dart:async';
import 'package:payroll_app/data/response/api_response.dart';
// import 'package:payroll_app/model/model.dart';
// import 'package:payroll_app/repository/home_repository.dart';

class WelcomeViewmodel with ChangeNotifier {
  // Basic UI state used by the welcome/login page
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isHiddenPassword = true;
  bool isHiddenUsername = false; // keep for parity with existing UI

  bool usernameValidate = false;
  bool passwordValidate = false;

  bool isLoading = false;

  // Simulated login method — replace with real API call
  Future<void> loginUser(String username, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      // TODO: call repository/api and handle result
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Simple button styles moved from controller
  ButtonStyle loginButtonStyle() {
    return TextButton.styleFrom(
      backgroundColor: Colors.white.withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  ButtonStyle loginButtonStyle2() {
    return TextButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}