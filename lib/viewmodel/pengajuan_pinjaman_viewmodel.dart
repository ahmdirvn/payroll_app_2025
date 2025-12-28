import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PengajuanPinjamanViewModel extends ChangeNotifier {
  bool isLoading = false;

  final name = TextEditingController();
  final nik = TextEditingController();
  final entitas = TextEditingController();
  final divisi = TextEditingController();
  final jabatan = TextEditingController();
  final pinjaman = TextEditingController();
  final keterangan = TextEditingController();

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    name.text = prefs.getString("name") ?? "";
    entitas.text = prefs.getString("entitas") ?? "";
    divisi.text = prefs.getString("divisi") ?? "";
    jabatan.text = prefs.getString("jabatan") ?? "";
  }

  bool validate(BuildContext context) {
    if (name.text.isEmpty || nik.text.length != 16 || pinjaman.text.isEmpty) {
      _dialog(context, 'Data tidak valid');
      return false;
    }
    return true;
  }

  Future<void> submit(BuildContext context) async {
    if (!validate(context)) return;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token") ?? "";

    isLoading = true;
    notifyListeners();

    final res = await http.post(
      Uri.parse("https://payroll-web-xmvbzkqsaq-et.a.run.app/api/pinjaman"),
      headers: {"Authorization": "Bearer $token"},
      body: {
        "nama": name.text,
        "nik": nik.text,
        "entitas": entitas.text,
        "divisi": divisi.text,
        "jabatan": jabatan.text,
        "nilai_pinjaman": pinjaman.text,
        "keterangan": keterangan.text,
      },
    );

    isLoading = false;
    notifyListeners();

    final data = jsonDecode(res.body);
    _dialog(context, data['message'] ?? 'Selesai', success: res.statusCode == 201);
  }

  void _dialog(BuildContext c, String msg, {bool success = false}) {
    showDialog(
      context: c,
      builder: (_) => AlertDialog(
        title: Text(success ? 'Success' : 'Error'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(c);
              if (success) Navigator.pop(c, 'refresh');
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
