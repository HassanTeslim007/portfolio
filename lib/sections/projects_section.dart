import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/project_data.dart';
import '../models/project_model.dart';
import '../widgets/project_card.dart';
import '../widgets/project_detail_view.dart';
import '../theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  void _showProjectDetails(BuildContext context, Project project) {
    if (project.title == 'Personal Portfolio') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppTheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: Text('Metaception', style: TextStyle(color: AppTheme.accent)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.auto_awesome, size: 48, color: AppTheme.accent),
              const SizedBox(height: 20),
              const Text(
                "You're already here!\n\nThis portfolio was built using a hybrid AI-accelerated workflow, reaching production-ready quality in record time.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('COOL'),
            ),
          ],
        ),
      );
      return;
    }
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => ProjectDetailView(
          project: project,
          scrollController: scrollController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 24 : 100,
      ),
      color: AppTheme.surface.withValues(alpha: 0.3),
      child: Column(
        children: [
          Text(
            'Featured Projects',
            style: Theme.of(context).textTheme.headlineMedium,
          ).animate().fadeIn().slideY(begin: 0.2),
          const SizedBox(height: 16),
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.accent,
              borderRadius: BorderRadius.circular(2),
            ),
          ).animate().fadeIn(delay: 200.ms).scaleX(),
          const SizedBox(height: 60),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: projects
                .map(
                  (project) => ProjectCard(
                    project: project,
                    onTap: () => _showProjectDetails(context, project),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
