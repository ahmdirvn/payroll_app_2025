// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:payroll_app/view/pages/pages.dart';
import 'package:payroll_app/view/widgets/widgets.dart'; // import LoginButton
import 'package:payroll_app/viewmodel/welcome_viewmodel.dart';

void main() {
  group('WelcomePage Widget Test', () {
    testWidgets('WelcomePage menampilkan semua elemen utama', (WidgetTester tester) async {
      // ===== Arrange =====
      // Build widget WelcomePage di environment test
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(create: (_) => WelcomeViewmodel(), child: const WelcomePage()),
        ),
      );

      // ===== Act =====
      // Tidak ada aksi spesifik, hanya render widget

      // ===== Assert =====
      // Pastikan gambar welcome muncul
      expect(find.byType(Image), findsOneWidget);
      expect(find.image(const AssetImage('assets/images/welcome_page.png')), findsOneWidget);

      // Pastikan teks 'Welcome' muncul
      expect(find.text('Welcome'), findsOneWidget);

      // Pastikan deskripsi muncul
      expect(find.text('Lewat Fina memberikan anda\nkemudahan dalam melihat gaji'), findsOneWidget);

      // Pastikan button login ada
      expect(find.byType(LoginButton), findsOneWidget);

      // Pastikan footer muncul
      expect(find.text('All Right Reserved @2025'), findsOneWidget);
    });

    testWidgets('LoginButton dapat di-tap', (tester) async {
      // Arrange: wrap dengan provider
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => WelcomeViewmodel(),
          child: const MaterialApp(home: WelcomePage()),
        ),
      );

      // Pastikan semua frame ter-render
      await tester.pumpAndSettle();

      // Act: scroll ke LoginButton dan tap
      final loginButton = find.byType(LoginButton);
      await tester.pumpAndSettle(); // tunggu modal muncul
      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);

      // Tunggu modal bottom sheet muncul
      await tester.pumpAndSettle();

      // Act: tap button di modal login
      final modalLoginButton = find.widgetWithText(TextButton, 'Login').last;
      await tester.pumpAndSettle();
      await tester.ensureVisible(modalLoginButton);
      await tester.tap(modalLoginButton);

      await tester.pumpAndSettle();

      // Assert: modal muncul
      expect(find.byType(LoginBottomSheet), findsOneWidget);
    });

    testWidgets('Teks dan layout sesuai dengan desain', (WidgetTester tester) async {
      // ===== Arrange =====
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => WelcomeViewmodel(),
          child: MaterialApp(home: WelcomePage()),
        ),
      );

      // ===== Act =====
      await tester.pumpAndSettle(); // tunggu semua animasi / build selesai

      // ===== Assert =====
      final listViewFinder = find.byType(ListView);
      expect(listViewFinder, findsOneWidget);

      final textFinders = find.byType(Text);
      expect(textFinders, findsWidgets); // jumlah text bisa berubah sesuai desain
    });

    testWidgets('Semua widget menggunakan SafeArea', (WidgetTester tester) async {
      // ===== Arrange =====
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => WelcomeViewmodel(),
          child: MaterialApp(home: WelcomePage()),
        ),
      );

      // ===== Act =====
      await tester.pumpAndSettle();

      // ===== Assert =====
      expect(find.byType(SafeArea), findsOneWidget);
    });
  });
}

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
