import 'package:flutter/material.dart';


class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.onActionPressed,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String? actionLabel;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Aylanadagi ikonka
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: scheme.primary.withOpacity(.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: scheme.primary),
            ),

            const SizedBox(height: 24),

            // Sarlavha
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 8),

            // Qo‘shimcha matn
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium
                  ?.copyWith(color: Colors.grey.shade600, height: 1.4),
            ),

            if (actionLabel != null && onActionPressed != null) ...[
              const SizedBox(height: 28),
              FilledButton(
                onPressed: onActionPressed,
                style: FilledButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
