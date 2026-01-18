import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_tilt/flutter_tilt.dart';
import '../models/project_model.dart';
import '../theme.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final VoidCallback onTap;

  const ProjectCard({super.key, required this.project, required this.onTap});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Tilt(
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: 300.ms,
            width: 350,
            decoration: BoxDecoration(
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _isHovered
                    ? widget.project.baseColor
                    : Theme.of(context).dividerColor.withValues(alpha: 0.1),
                width: 2,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: widget.project.baseColor.withValues(alpha: 0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project Logo area
                Container(
                  height: 180,
                  width: double.infinity,
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: widget.project.baseColor.withValues(alpha: 0.05),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Image.asset(
                          widget.project.logoPath,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (widget.project.isAiAccelerated)
                              _buildBadge(
                                    Icons.bolt,
                                    'AI-OPTIMIZED',
                                    AppTheme.accent,
                                  )
                                  .animate()
                                  .fadeIn(delay: 600.ms)
                                  .slideX(begin: 0.5),
                            if (widget.project.isOpenSource)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child:
                                    _buildBadge(
                                          Icons.hub_outlined,
                                          'OPEN SOURCE',
                                          Colors.blueAccent,
                                        )
                                        .animate()
                                        .fadeIn(delay: 800.ms)
                                        .slideX(begin: 0.5),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.title,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium!.copyWith(fontSize: 24),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.project.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'View Details',
                            style: TextStyle(
                              color: widget.project.baseColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: widget.project.baseColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 500.ms).scale(begin: const Offset(0.9, 0.9));
  }

  Widget _buildBadge(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
