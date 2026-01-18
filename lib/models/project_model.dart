import 'package:flutter/material.dart';

class Project {
  final String title;
  final String description;
  final String logoPath;
  final String splashPath;
  final List<String> screenshotPaths;
  final String? url;
  final Color baseColor;
  final List<String> technologies;
  final List<String> features;
  final String role;
  final bool isAiAccelerated;

  Project({
    required this.title,
    required this.description,
    required this.logoPath,
    required this.splashPath,
    required this.screenshotPaths,
    this.url,
    this.baseColor = Colors.cyanAccent,
    this.technologies = const [],
    this.features = const [],
    this.role = 'Lead Developer',
    this.isAiAccelerated = false,
  });
}
