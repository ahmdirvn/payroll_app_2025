import 'package:flutter/material.dart';
import 'package:payroll_app/data/response/login_result.dart';
import 'package:payroll_app/model/login_response_model.dart';
import 'dart:async';

import 'package:payroll_app/repository/auth_repository.dart';
import 'package:payroll_app/repository/auth_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:payroll_app/model/model.dart';
// import 'package:payroll_app/repository/home_repository.dart';

class WelcomeViewmodel with ChangeNotifier {
  // Using repository pattern for data operations
  final AuthRepository _authRepository = AuthRepositoryImpl();
  // Basic UI state used by the welcome/login page
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isHiddenPassword = true;
  bool isHiddenUsername = false; // keep for parity with existing UI
  bool usernameValidate = false;
  bool passwordValidate = false;
  bool isLoading = false;

  // Simulated login method — will use with real API later
  // ==========================
  // LOGIN
  // ==========================
  Future<LoginResult> loginUser(String username, String password) async {
    isLoading = true;
    notifyListeners();

    if (!validateLogin(username, password)) {
      print("Invalid credentials format");
      isLoading = false;
      notifyListeners();
      return LoginResult.invalidCredential;
    }
    print("Attempting login for $username");
    try {
      final response = await _authRepository.login(username: username, password: password);
      print(response);
      // sukses → simpan user
      await _saveUser(response);
      return LoginResult.success;
    } catch (e) {
      isLoading = false;
      notifyListeners();
      return LoginResult.error;
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
  // ==========================
  // VALIDATION
  // ==========================
  bool validateLogin(String username, String password) {
    usernameValidate = username.trim().isEmpty;
    passwordValidate = password.trim().isEmpty;

    if (!usernameValidate && !_isValidEmail(username)) {
      usernameValidate = true;
    }

    return !usernameValidate && !passwordValidate;
  }

  // ==========================
  // SAVE USER
  // ==========================
  Future<void> _saveUser(LoginResponseModel data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", data.data.token);
    prefs.setString("name", data.data.user.nama);
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
