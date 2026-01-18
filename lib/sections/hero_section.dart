import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 100),
      child: Stack(
        children: [
          // Background subtle decoration
          Positioned(
            right: -100,
            top: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                color: AppTheme.accent.withValues(alpha: 0.05),
                shape: BoxShape.circle,
              ),
            ),
          ).animate().fadeIn(duration: 2.seconds).scale(),

          Center(
            child: isMobile
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _content(context, isMobile),
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _content(context, isMobile),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: _heroImage()
                            .animate()
                            .fadeIn(delay: 500.ms)
                            .slideX(begin: 0.1),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  List<Widget> _content(BuildContext context, bool isMobile) {
    return [
      Text(
        'Hassan Teslim Babatunde',
        style: Theme.of(context).textTheme.headlineLarge,
        textAlign: isMobile ? TextAlign.center : TextAlign.start,
      ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),
      const SizedBox(height: 12),
      Text(
        'FLUTTER DEVELOPER',
        style: TextStyle(
          fontSize: 20,
          color: AppTheme.accent,
          fontWeight: FontWeight.bold,
          letterSpacing: 4.0,
        ),
      ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideY(begin: 0.2),
      const SizedBox(height: 24),
      Text(
        'I am a Computer Science Graduate and Full-Stack Engineer with a strong foundation in Fintech C#/.NET backend systems. I specialize in building high-performance, beautiful mobile applications with Flutter, leveraging cutting-edge AI to accelerate and optimize every stage of development.',
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: isMobile ? TextAlign.center : TextAlign.start,
      ).animate().fadeIn(delay: 400.ms, duration: 800.ms).slideY(begin: 0.2),
      const SizedBox(height: 40),
      ElevatedButton(
        onPressed: () {},
        child: const Text('VIEW PROJECTS'),
      ).animate().fadeIn(delay: 600.ms).scale(),
    ];
  }

  Widget _heroImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppTheme.accent.withValues(alpha: 0.1),
            blurRadius: 50,
            spreadRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset('assets/image.png', fit: BoxFit.cover),
      ),
    );
  }
}
