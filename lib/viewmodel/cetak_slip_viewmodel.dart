import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class CetakSlipViewModel extends ChangeNotifier {
  final ReceivePort _port = ReceivePort();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool isLoading = false;

  late int currentYear;
  late int currentMonth;
  late List<String> tahun;
  late List<String> bulan;

  late String _token;

  // ===== INIT =====
  Future<void> init() async {
    _registerDownloader();

    currentYear = DateTime.now().year;
    currentMonth = DateTime.now().month;

    tahun = List.generate(5, (i) => '${currentYear - i}').reversed.toList();

    bulan = List.generate(12, (i) {
      int month = currentMonth - i;
      if (month <= 0) month += 12;
      return '$month';
    }).reversed.toList();

    final prefs = await _prefs;
    _token = prefs.getString("token") ?? "";

    notifyListeners();
  }

  // ===== DROPDOWN =====
  void updateMonth(String value) {
    currentMonth = int.parse(value);
    notifyListeners();
  }

  void updateYear(String value) {
    currentYear = int.parse(value);
    notifyListeners();
  }

  // ===== DOWNLOAD HANDLER =====
  void _registerDownloader() {
    IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final send = IsolateNameServer.lookupPortByName('downloader_send_port');
    send?.send([id, status, progress]);
  }

  // ===== CETAK SLIP =====
  Future<void> cetakSlip(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final headers = {'Authorization': 'Bearer $_token', 'Content-Type': 'application/json'};

      final url =
          'https://payroll-web-xmvbzkqsaq-et.a.run.app/api/download-pdf'
          '?bulan=$currentMonth&tahun=$currentYear';

      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        String fileName = "slip_gaji_$currentMonth$currentYear.pdf";

        final dir = await getExternalStorageDirectory();
        final file = File('${dir!.path}/$fileName');
        await file.writeAsBytes(response.bodyBytes);

        if (await Permission.storage.request().isGranted) {
          await FlutterDownloader.enqueue(
            url: url,
            headers: headers,
            savedDir: dir.path,
            fileName: fileName,
            showNotification: true,
            openFileFromNotification: true,
          );
        }

        OpenFile.open(file.path);
      } else {
        _showError(context, "Gagal mencetak slip");
      }
    } catch (e) {
      _showError(context, e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void _showError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Failed"),
        content: Text(message),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close"))],
      ),
    );
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }
}
