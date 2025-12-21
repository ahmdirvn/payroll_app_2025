// Mengimpor package flutter_test untuk menulis unit test
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

// Mengimpor ViewModel yang akan diuji (logic aplikasi)
import 'package:payroll_app/viewmodel/welcome_viewmodel.dart';
//menggunakan Struktur (AAA - Arrange, Act, Assert):

// Arrange (Persiapan): Siapkan data, mock objek, atau kondisi awal.

// Act (Aksi): Panggil fungsi atau method yang akan diuji.

// Assert (Verifikasi): Periksa apakah hasilnya sesuai ekspektasi
// menggunakan expect(). 

void main() {
  // Mengelompokkan test agar lebih rapi dan mudah dibaca
  group('WelcomeViewmodel Unit Test', () {
    
    // Deklarasi variabel ViewModel yang akan dipakai di setiap test
    late WelcomeViewmodel viewModel;

    // Method ini dijalankan sebelum setiap test
    setUp(() {
      // ===== Arrange =====
      // Membuat instance baru WelcomeViewmodel
      viewModel = WelcomeViewmodel();
    });

    test('loginUser mengubah isLoading menjadi true lalu false', () async {
      // ===== Arrange =====
      // Menyiapkan data input username dan password
      const String username = 'admin';
      const String password = '123456';

      // ===== Act =====
      // Memanggil method loginUser
      final Future<void> future = viewModel.loginUser(username, password);

      // ===== Assert (kondisi awal setelah dipanggil) =====
      // Memastikan isLoading langsung bernilai true saat proses login dimulai
      expect(viewModel.isLoading, true);

      // Menunggu proses async (Future.delayed) selesai
      await future;

      // ===== Assert (kondisi akhir) =====
      // Memastikan isLoading kembali menjadi false setelah proses selesai
      expect(viewModel.isLoading, false);
    });

    test('Default state WelcomeViewmodel sesuai nilai awal', () {
      // ===== Arrange =====
      // Membuat instance ViewModel
      final viewModel = WelcomeViewmodel();

      // ===== Act =====
      // Tidak ada aksi, hanya membaca nilai awal

      // ===== Assert =====
      // Memastikan state awal sesuai dengan yang didefinisikan
      expect(viewModel.isLoading, false);
      expect(viewModel.isHiddenPassword, true);
      expect(viewModel.isHiddenUsername, false);
      expect(viewModel.usernameValidate, false);
      expect(viewModel.passwordValidate, false);
    });

    test('TextEditingController awalnya kosong', () {
      // ===== Arrange =====
      // ViewModel sudah diinisialisasi

      // ===== Act =====
      final usernameText = viewModel.usernameController.text;
      final passwordText = viewModel.passwordController.text;

      // ===== Assert =====
      expect(usernameText, '');
      expect(passwordText, '');
    });

    // Mendefinisikan unit test untuk method dispose()
    test('dispose() dapat dipanggil tanpa menimbulkan error', () {
      // ===== Arrange (Persiapan) =====
      // Membuat instance WelcomeViewmodel
      final viewModel = WelcomeViewmodel();

      // ===== Act & Assert (Aksi + Verifikasi) =====
      // Memastikan bahwa pemanggilan dispose() tidak menghasilkan exception
      expect(
        () => viewModel.dispose(),
        returnsNormally,
      );
    });

    test('loginButtonStyle mengembalikan ButtonStyle', () {
      // ===== Arrange =====
      // Tidak ada data khusus yang perlu disiapkan

      // ===== Act =====
      // Memanggil method loginButtonStyle
      final buttonStyle = viewModel.loginButtonStyle();

      // ===== Assert =====
      // Memastikan hasilnya tidak null
      expect(buttonStyle, isNotNull);

      // Memastikan tipe data yang dikembalikan adalah ButtonStyle
      expect(buttonStyle, isA<ButtonStyle>());
    });

    test('loginButtonStyle2 mengembalikan ButtonStyle', () {
      // ===== Arrange =====
      // Tidak ada data khusus yang perlu disiapkan

      // ===== Act =====
      // Memanggil method loginButtonStyle2
      final buttonStyle = viewModel.loginButtonStyle2();

      // ===== Assert =====
      // Memastikan hasilnya tidak null
      expect(buttonStyle, isNotNull);

      // Memastikan tipe data yang dikembalikan adalah ButtonStyle
      expect(buttonStyle, isA<ButtonStyle>());
    });
  });
}
