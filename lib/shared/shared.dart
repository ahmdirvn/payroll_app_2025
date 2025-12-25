import 'package:flutter/material.dart';
part 'const.dart';

BuildContext get globalContext {
  return Get.currentContext!;
}

class Get {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext? get currentContext {
    return navigatorKey.currentState?.context;
  }

  static Future to(Widget page) async {
    return await navigatorKey.currentState!.push(MaterialPageRoute(builder: (context) => page));
  }

  static void back() {
    if (Navigator.canPop(globalContext) == false) return;
    Navigator.pop(globalContext);
  }

  static Future offAll(page) {
    return navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false,
    );
  }

  static double get width {
    return MediaQuery.of(currentContext!).size.width;
  }

  static double get height {
    return MediaQuery.of(currentContext!).size.width;
  }

  static ValueNotifier<ThemeData> mainTheme = ValueNotifier<ThemeData>(ThemeData());
  static void changeTheme(ThemeData theme) {
    mainTheme.value = theme;
  }

  static ThemeData get theme {
    return Theme.of(Get.currentContext!);
  }
}
