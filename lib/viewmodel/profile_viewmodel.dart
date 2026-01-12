import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:payroll_app/repository/profile_repository.dart';
import 'package:payroll_app/repository/profile_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/get_profile_reponse_model.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepository _repo = ProfileRepositoryImpl();
  // controller form
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  GetProfileResponModel? profile;
  bool isLoading = false;

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  Future<void> loadProfile() async {
    try {
      isLoading = true;
      notifyListeners();

      profile = await _repo.getProfile();
      print(profile);
      nameController.text = profile!.data.nama;
      emailController.text = profile!.data.email;
    } catch (e) {
      debugPrint('Load profile error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProfile(BuildContext context) async {
    if (passwordController.text.isNotEmpty && passwordController.text != confirmPasswordController.text) {
      _showSnack(context, 'Password tidak sama');
      return;
    }

    try {
      isLoading = true;
      notifyListeners();

      final message = await _repo.updateProfile(
        nama: nameController.text,
        email: emailController.text,
        password: passwordController.text.isEmpty ? null : passwordController.text,
      );

      _showDialog(context, message);
      passwordController.clear();
      confirmPasswordController.clear();
    } catch (e) {
      _showSnack(context, e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void logout(BuildContext context) async {
    // backend logout optional → local clear cukup
    Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (_) => false);
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _showDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text('Success', textAlign: TextAlign.center),
        content: Text(msg, textAlign: TextAlign.center),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
