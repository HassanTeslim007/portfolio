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
  final GlobalKey _projectsKey = GlobalKey();

  void _scrollToProjects() {
    final context = _projectsKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background subtle noise or gradient could go here
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(onViewProjects: _scrollToProjects),
                ProjectsSection(key: _projectsKey),
                const SkillsSection(),
                const ContactSection(),
                const SizedBox(height: 100),
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
