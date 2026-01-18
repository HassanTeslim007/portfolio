import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project_model.dart';

class ProjectDetailView extends StatelessWidget {
  final Project project;
  final ScrollController? scrollController;

  const ProjectDetailView({
    super.key,
    required this.project,
    this.scrollController,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            project.baseColor.withValues(alpha: 0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(context).dividerColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center for the fan
                children: [
                  // Header
                  _buildHeader(context),

                  const SizedBox(height: 40),

                  // The Fan Gallery
                  _FanGallery(
                    paths: project.screenshotPaths,
                  ).animate().fadeIn(delay: 400.ms).scale(),

                  const SizedBox(height: 60),

                  // Project Details Grid
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _InfoSection(
                              title: 'KEY FEATURES',
                              items: project.features,
                              color: project.baseColor,
                            ),
                            const SizedBox(height: 32),
                            _InfoSection(
                              title: 'ROLE',
                              content: project.role,
                              color: project.baseColor,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 1,
                        child: _TechStack(
                          techs: project.technologies,
                          color: project.baseColor,
                        ),
                      ),
                    ],
                  ),

                  if (project.url != null) ...[
                    const SizedBox(height: 60),
                    Center(
                      child: OutlinedButton.icon(
                        onPressed: () => _launchUrl(project.url!),
                        icon: const Icon(Icons.open_in_new),
                        label: Text(
                          project.isOpenSource
                              ? 'VIEW ON GITHUB'
                              : 'VIEW PROJECT',
                          style: const TextStyle(
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: project.baseColor,
                          side: BorderSide(color: project.baseColor),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2),
                    ),
                  ],

                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: project.baseColor.withValues(alpha: 0.3)),
          ),
          child: Image.asset(project.logoPath),
        ).animate().fadeIn().scale(),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.title,
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium!.copyWith(fontSize: 28),
              ).animate().fadeIn(delay: 100.ms).slideX(begin: 0.1),
              Text(
                project.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.1),
            ],
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: Theme.of(context).iconTheme.color),
        ),
      ],
    );
  }
}

class _FanGallery extends StatelessWidget {
  final List<String> paths;

  const _FanGallery({required this.paths});

  @override
  Widget build(BuildContext context) {
    // Only use up to 3-5 images for the fan to keep it clean
    final images = paths.take(5).toList();
    if (images.isEmpty) return const SizedBox.shrink();

    return Center(
      child: SizedBox(
        height: 400,
        width: 600,
        child: Stack(
          alignment: Alignment.center,
          children: images.asMap().entries.map((entry) {
            final index = entry.key;
            final path = entry.value;
            final count = images.length;

            // Calculate rotation and translation
            // 0 -> -0.3rad, middle -> 0rad, end -> 0.3rad
            final double rotation = (index - (count - 1) / 2) * 0.15;
            final double translationX = (index - (count - 1) / 2) * 80;
            final double translationY = (index - (count - 1) / 2).abs() * 20;

            return Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..translate(translationX, translationY)
                ..rotateZ(rotation),
              child: Container(
                width: 200,
                height: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).dividerColor.withValues(alpha: 0.1),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 20,
                      spreadRadius: -10,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(path, fit: BoxFit.cover),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final List<String>? items;
  final String? content;
  final Color color;

  const _InfoSection({
    required this.title,
    this.items,
    this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(title: title, color: color),
        const SizedBox(height: 16),
        if (content != null)
          Text(content!, style: textStyle.copyWith(fontSize: 18)),
        if (items != null)
          ...items!.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Icon(Icons.check_circle_outline, color: color, size: 18),
                  const SizedBox(width: 12),
                  Text(item, style: textStyle.copyWith(fontSize: 16)),
                ],
              ),
            ),
          ),
      ],
    ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1);
  }
}

class _TechStack extends StatelessWidget {
  final List<String> techs;
  final Color color;

  const _TechStack({required this.techs, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionLabel(title: 'TECHNOLOGIES', color: color),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: techs
              .map(
                (tech) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: color.withValues(alpha: 0.3)),
                  ),
                  child: Text(
                    tech,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1);
  }
}

class _SectionLabel extends StatelessWidget {
  final String title;
  final Color color;

  const _SectionLabel({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Theme.of(
              context,
            ).textTheme.bodyLarge!.color!.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
