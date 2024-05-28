import 'package:flutter/material.dart';
import 'package:github_io_0x7han/provider/key_provider.dart';
import 'package:github_io_0x7han/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomSectionWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;
  const CustomSectionWidget(
      {super.key,
      required this.title,
      required this.content,
      required this.actions, });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

           final ThemeProvider read = context.read<ThemeProvider>();
    final ThemeProvider watch = context.watch<ThemeProvider>();

    final keyProvider = KeyProvider.of(context);

    bool isNotHover = watch.hoverSection != null && watch.hoverSection != keyProvider!.key; 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w500,
              
              color: colorScheme.onSurface.withOpacity(0.5)),
        ),
        const SizedBox(
          height: 8,
        ),
        DefaultTextStyle(
          
          style: textTheme.bodyMedium!.copyWith(
    
            color: colorScheme.onSurface.withOpacity(isNotHover ? 0.2 : 0.8),
          ),
          child: content,
        ),
        const SizedBox(
          height: 16,
        ),
        KeyProvider(
    key: keyProvider?.key,
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      direction: Axis.horizontal,
          children: actions,
        ),
        ),
        
      ],
    );
  }
}
