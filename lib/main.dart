import 'package:flutter/material.dart';
import 'package:payroll_app/shared/ui_helper.dart';
import 'package:payroll_app/viewmodel/profile_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:payroll_app/shared/shared.dart';
import 'package:payroll_app/viewmodel/welcome_viewmodel.dart';
import 'package:payroll_app/viewmodel/home_viewmodel.dart';
import 'package:payroll_app/view/pages/pages.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WelcomeViewmodel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        // provider lain taruh sini
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeViewmodel(),
      child: MaterialApp(
        scaffoldMessengerKey: rootMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Payroll App',
        navigatorKey: Get.navigatorKey,
        home: const WelcomePage(),
      ),
    );
  }
}
