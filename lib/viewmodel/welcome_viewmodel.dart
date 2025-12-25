import 'package:flutter/material.dart';
import 'dart:async';
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

  // Simulated login method — will use with real API later
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

  bool _isValidEmail(String email) {
    // regex sederhana untuk email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Method untuk validasi input login
  bool validateLogin() {
    String username = usernameController.text.trim();
    // Mengecek apakah username kosong
    usernameValidate = usernameController.text.isEmpty;
    // Mengecek apakah password kosong
    passwordValidate = passwordController.text.isEmpty;
    // cek format email jika tidak kosong
    if (!usernameValidate && !_isValidEmail(username)) {
      usernameValidate = true; // anggap invalid format = error
    }
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
