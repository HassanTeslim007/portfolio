import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 24 : 100,
      ),
      color: Theme.of(context).cardTheme.color!.withValues(alpha: 0.3),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.headlineMedium,
          ).animate().fadeIn().slideY(begin: 0.2),
          const SizedBox(height: 16),
          const Text(
            'Have a project in mind? Let’s talk.',
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildTextField(
                    context,
                    label: 'Name',
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(height: 24),
                  _buildTextField(
                    context,
                    label: 'Email',
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 24),
                  _buildTextField(
                    context,
                    label: 'Message',
                    icon: Icons.message_outlined,
                    maxLines: 5,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('SEND MESSAGE'),
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),
        ],
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    final textStyle = Theme.of(context).textTheme.bodyMedium!;

    return TextFormField(
      maxLines: maxLines,
      style: textStyle.copyWith(color: Theme.of(context).colorScheme.onSurface),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: textStyle.copyWith(color: Theme.of(context).hintColor),
        prefixIcon: Icon(icon, color: Theme.of(context).colorScheme.primary),
        filled: true,
        fillColor: Theme.of(
          context,
        ).scaffoldBackgroundColor.withValues(alpha: 0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
