import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../sections/contact_section.dart';
import '../widgets/theme_toggle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background subtle noise or gradient could go here
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: const [
                HeroSection(),
                ProjectsSection(),
                SkillsSection(),
                ContactSection(),
                SizedBox(height: 100),
              ],
            ),
          ),

          // Custom Navigation Bar could go here (Floating)
          Positioned(
            top: 40,
            right: 40,
            child: const ThemeToggle()
                .animate()
                .fadeIn(delay: 1.seconds)
                .slideY(begin: -0.2),
          ),
        ],
      ),
    );
  }
}
