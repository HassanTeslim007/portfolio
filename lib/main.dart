import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'theme.dart';

final themeNotifier = ValueNotifier<ThemeMode>(ThemeMode.dark);

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, mode, __) {
        return MaterialApp(
          title: 'Hassan Teslim | Flutter Portfolio',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          home: const HomePage(),
        );
      },
    );
  }
}
