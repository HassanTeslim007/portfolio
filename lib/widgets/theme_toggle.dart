import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';
import '../theme.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        final isDark = mode == ThemeMode.dark;

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
            },
            child: Container(
              width: 80,
              height: 40,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.surface : AppTheme.lightSurface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: (isDark ? AppTheme.accent : Colors.black12).withValues(
                    alpha: 0.3,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: 400.ms,
                    curve: Curves.easeInOutBack,
                    alignment: isDark
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppTheme.accent,
                        shape: BoxShape.circle,
                      ),
                      child:
                          Icon(
                                isDark ? Icons.dark_mode : Icons.light_mode,
                                size: 18,
                                color: Colors.white,
                              )
                              .animate(key: ValueKey(isDark))
                              .rotate(begin: -0.5, end: 0, duration: 400.ms),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
