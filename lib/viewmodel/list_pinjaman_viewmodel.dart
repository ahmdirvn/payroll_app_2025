import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/get_list_pinjaman_model.dart';

class ListPinjamanViewModel extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool isLoading = false;
  bool isLoadingCetak = false;

  List<Datum> riwayatPinjaman = [];

  /// ================= TOKEN =================
  Future<String> _getToken() async {
    final prefs = await _prefs;
    return prefs.getString("token") ?? "";
  }

  /// ================= FETCH LIST =================
  Future<void> fetchPinjaman() async {
    isLoading = true;
    notifyListeners();

    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('https://payroll-web-xmvbzkqsaq-et.a.run.app/api/pinjaman'),
        headers: {'Authorization': 'Bearer $token'},
      );

      final model = GetListPinjamanModel.fromJson(json.decode(response.body));

      riwayatPinjaman = model.data;
      riwayatPinjaman.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  /// ================= CETAK PDF =================
  Future<void> cetakPinjaman(int id) async {
    isLoadingCetak = true;
    notifyListeners();

    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('https://payroll-web-xmvbzkqsaq-et.a.run.app/api/cetak-pinjaman/$id'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/pinjaman_$id.pdf');
        await file.writeAsBytes(response.bodyBytes);
        OpenFile.open(file.path);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoadingCetak = false;
      notifyListeners();
    }
  }

  /// ================= STYLE =================
  ButtonStyle buttonPinjaman() {
    return TextButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF5BCFC5),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      minimumSize: const Size(310, 60),
    );
  }

  String formatRupiah(int value) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0).format(value);
  }
}
