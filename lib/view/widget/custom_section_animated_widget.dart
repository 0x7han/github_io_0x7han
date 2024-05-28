import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomSectionAnimatedWidget extends StatelessWidget {
  final String title;
  final List<AnimatedText> animatedTexts;
  final List<Widget> actions;
  const CustomSectionAnimatedWidget({super.key, required this.title, required this.animatedTexts, required this.actions});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
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
        AnimatedTextKit(
          pause: const Duration(milliseconds: 20),
          repeatForever: true,
          animatedTexts: animatedTexts,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
        children: actions,),
      ],
    );
  }
}
