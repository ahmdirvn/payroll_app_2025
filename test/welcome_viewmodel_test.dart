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

  // Deklarasi variabel ViewModel yang akan dipakai di setiap test
  late WelcomeViewmodel viewModel;

  // Method ini dijalankan sebelum setiap test
  setUp(() {
    // ===== Arrange =====
    // Membuat instance baru WelcomeViewmodel
    viewModel = WelcomeViewmodel();
  });

  group('WelcomeViewmodel Unit Test', () {
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
      expect(() => viewModel.dispose(), returnsNormally);
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

    test('validateLogin gagal jika username & password kosong', () {
      // ===== Arrange (Persiapan) =====
      // Mengosongkan nilai username dan password
      // untuk mensimulasikan kondisi user belum mengisi form login
      viewModel.usernameController.text = '';
      viewModel.passwordController.text = '';

      // ===== Act (Aksi) =====
      // Memanggil method validateLogin untuk melakukan validasi input
      final result = viewModel.validateLogin('', '');

      // ===== Assert (Verifikasi) =====
      // Memastikan hasil validasi bernilai false
      // karena username dan password tidak diisi
      expect(result, false);

      // Memastikan flag validasi username bernilai true
      // yang menandakan terdapat error pada input username
      expect(viewModel.usernameValidate, true);

      // Memastikan flag validasi password bernilai true
      // yang menandakan terdapat error pada input password
      expect(viewModel.passwordValidate, true);
    });

    test('togglePasswordVisibility membalik isHiddenPassword', () {
      // ===== Arrange (Persiapan) =====
      // Menyimpan nilai awal isHiddenPassword
      // sebagai pembanding setelah method dipanggil
      final initial = viewModel.isHiddenPassword;

      // ===== Act (Aksi) =====
      // Memanggil method togglePasswordVisibility
      // untuk mengubah status visibilitas password
      viewModel.togglePasswordVisibility();

      // ===== Assert (Verifikasi) =====
      // Memastikan nilai isHiddenPassword berubah
      // menjadi kebalikan dari nilai sebelumnya
      expect(viewModel.isHiddenPassword, !initial);
    });

    test('validateLogin gagal jika email tidak sesuai format', () {
      // ===== Arrange =====
      viewModel.usernameController.text = 'invalidemail.com'; // tanpa @
      viewModel.passwordController.text = '123456';

      // ===== Act =====
      final result = viewModel.validateLogin('invalidemail.com', '123456');

      // ===== Assert =====
      expect(result, false);
      expect(viewModel.usernameValidate, true); // email invalid dianggap error
      expect(viewModel.passwordValidate, false); // password sudah terisi
    });

    test('validateLogin berhasil jika email valid dan password terisi', () {
      // ===== Arrange =====
      viewModel.usernameController.text = 'test@email.com';
      viewModel.passwordController.text = '123456';

      // ===== Act =====
      final result = viewModel.validateLogin('test@email.com', '123456');

      // ===== Assert =====
      expect(result, true);
      expect(viewModel.usernameValidate, false);
      expect(viewModel.passwordValidate, false);
    });
  });
}
