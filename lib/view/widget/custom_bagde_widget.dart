import 'package:flutter/material.dart';
import 'package:github_io_0x7han/provider/key_provider.dart';
import 'package:github_io_0x7han/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomBadgeWidget extends StatelessWidget {
  final bool isIncrase;
  final String label;
  final List<Widget> contents;
  const CustomBadgeWidget(
      {super.key,
      this.isIncrase = false,
      required this.label,
      required this.contents});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final ThemeProvider read = context.read<ThemeProvider>();
    final ThemeProvider watch = context.watch<ThemeProvider>();

    final keyProvider = KeyProvider.of(context);

    bool isNotHover =
        watch.hoverSection != null && watch.hoverSection != keyProvider!.key;

    return DefaultTextStyle( 
      style: textTheme.bodyMedium!.copyWith(
        color: colorScheme.onSurface.withOpacity(0.5),
      ),
      child: SizedBox(
        
        width: 200,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isIncrase
                    ? Text('+',
                        style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary.withOpacity(isNotHover ? 0.4 : 1)))
                    : const SizedBox(),
                Text(
                  label,
                  style: textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.bold, color: colorScheme.primary.withOpacity(isNotHover ? 0.4 : 1)),
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contents,
            ),
          ],
        ),
      ),
    );
  }
}
