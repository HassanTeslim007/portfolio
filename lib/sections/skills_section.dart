import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    final mobileSkills = [
      {'name': 'Flutter', 'icon': Icons.flutter_dash},
      {'name': 'Dart', 'icon': Icons.code},
      {'name': 'State Management', 'icon': Icons.layers_outlined},
      {'name': 'UI/UX Design', 'icon': Icons.palette_outlined},
    ];

    final polyglotSkills = [
      {'name': 'Python', 'icon': Icons.code},
      {'name': 'Java', 'icon': Icons.code},
      {'name': 'JS / HTML / CSS', 'icon': Icons.web_outlined},
      {'name': 'Data Structures', 'icon': Icons.account_tree_outlined},
    ];

    final backendSkills = [
      {'name': 'C# / .NET', 'icon': Icons.terminal},
      {'name': 'SQL / Databases', 'icon': Icons.storage},
      {'name': 'Finance Systems', 'icon': Icons.account_balance_outlined},
      {'name': 'Cloud (Azure/AWS)', 'icon': Icons.cloud_queue},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 24 : 100,
      ),
      child: Column(
        children: [
          Text(
            'Full-Stack Expertise',
            style: Theme.of(context).textTheme.headlineMedium,
          ).animate().fadeIn().slideY(begin: 0.2),
          const SizedBox(height: 16),
          const Text(
            'Computer Scientist bridging the gap between deep foundations and modern mobile experiences.',
            style: TextStyle(color: Colors.white70),
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 60),

          if (!isMobile)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildSkillCategory(context, 'MOBILE', mobileSkills),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: _buildSkillCategory(context, 'BACKEND', backendSkills),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: _buildSkillCategory(
                    context,
                    'FOUNDATIONS',
                    polyglotSkills,
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                _buildSkillCategory(
                  context,
                  'MOBILE DEVELOPMENT',
                  mobileSkills,
                ),
                const SizedBox(height: 40),
                _buildSkillCategory(
                  context,
                  'BACKEND & FINTECH',
                  backendSkills,
                ),
                const SizedBox(height: 40),
                _buildSkillCategory(context, 'CS FOUNDATIONS', polyglotSkills),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String title,
    List<Map<String, dynamic>> skills,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppTheme.accent,
            letterSpacing: 2.0,
          ),
        ).animate().fadeIn(),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills.asMap().entries.map((entry) {
            final skill = entry.value;
            final index = entry.key;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    skill['icon'] as IconData,
                    color: AppTheme.accent,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    skill['name'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: (100 * index).ms).scale();
          }).toList(),
        ),
      ],
    );
  }
}
