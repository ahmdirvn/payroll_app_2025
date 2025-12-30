import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/get_profile_reponse_model.dart';

class ProfileViewModel extends ChangeNotifier {
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
    isLoading = true;
    notifyListeners();

    final token = await _getToken();
    final response = await http.get(
      Uri.parse('https://payroll-web-xmvbzkqsaq-et.a.run.app/api/profile'),
      headers: {'Authorization': 'Bearer $token'},
    );

    profile = getProfileResponModelFromJson(response.body);
    nameController.text = profile!.data.nama;
    emailController.text = profile!.data.email;

    isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfile(BuildContext context) async {
    if (passwordController.text.isEmpty || confirmPasswordController.text.isEmpty) {
      _showSnack(context, 'Password tidak boleh kosong');
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _showSnack(context, 'Password tidak sama');
      return;
    }

    final token = await _getToken();

    final response = await http.put(
      Uri.parse('https://payroll-web-xmvbzkqsaq-et.a.run.app/api/profile/update'),
      headers: {'Authorization': 'Bearer $token'},
      body: {'nama': nameController.text, 'email': emailController.text, 'password': passwordController.text},
    );

    if (response.statusCode == 200) {
      final message = jsonDecode(response.body)['message'];
      _showDialog(context, message);
    }
  }

  Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (route) => false);
  }

  void _showSnack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  void _showDialog(BuildContext context, String msg) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Success', textAlign: TextAlign.center),
        content: Text(msg, textAlign: TextAlign.center),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
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
