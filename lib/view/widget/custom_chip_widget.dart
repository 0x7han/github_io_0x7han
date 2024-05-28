import 'package:flutter/material.dart';

class CustomChipWidget extends StatelessWidget {
  final String label;
  const CustomChipWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
        final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                          color: colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(32)),
                      child: Text(
                        label,
                        style: TextStyle(
                            fontSize: 12,
                            color: colorScheme.onSurface.withOpacity(0.5),
                            fontWeight: FontWeight.w600),
                      ),
                    );
  }
}