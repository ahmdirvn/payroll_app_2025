import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:payroll_app/shared/shared.dart';
import 'package:payroll_app/viewmodel/welcome_viewmodel.dart';
import 'package:payroll_app/view/pages/pages.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WelcomeViewmodel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Payroll App',
        navigatorKey: Get.navigatorKey,
        home: const HomeView(),
      ),
    );
  }
}
