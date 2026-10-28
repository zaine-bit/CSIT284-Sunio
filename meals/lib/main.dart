import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/navigation/app_routes.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/utils/app_settings.dart';

ThemeData buildTheme(Brightness brightness) {
  final base = ThemeData(brightness: brightness, useMaterial3: true);
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: brightness,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(base.textTheme),
  );
}

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, themeMode, _) {
        return MaterialApp(
          theme: buildTheme(Brightness.light),
          darkTheme: buildTheme(Brightness.dark),
          themeMode: themeMode,
          home: const TabsScreen(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
          onUnknownRoute: AppRoutes.onUnknownRoute,
        );
      },
    );
  }
}
