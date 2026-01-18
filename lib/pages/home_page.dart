import 'package:flutter/material.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../sections/contact_section.dart';

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
        ],
      ),
    );
  }
}
