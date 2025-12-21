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

  // Method untuk validasi input login
  bool validateLogin() {
    // Mengecek apakah username kosong
    usernameValidate = usernameController.text.isEmpty;
    // Mengecek apakah password kosong
    passwordValidate = passwordController.text.isEmpty;
    // Memberi tahu UI bahwa state berubah
    notifyListeners();
    // Return true jika valid
    return !usernameValidate && !passwordValidate;
  }

  // Method untuk toggle visibilitas password
  void togglePasswordVisibility() {
    isHiddenPassword = !isHiddenPassword;
    notifyListeners();
  }

  // Simple button styles moved from controller
  ButtonStyle loginButtonStyle() {
    return TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      minimumSize: const Size(100, 40),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        side: BorderSide(color: Colors.white, width: 3),
      ),
    );
  }

  // Alternative button style
  ButtonStyle loginButtonStyle2() {
    return TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF5BCFC5),
      minimumSize: const Size(100, 40),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
    );
  }

  // Cleanup controllers when ViewModel is disposed
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
