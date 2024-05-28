import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:github_io_0x7han/view/widget/custom_section_animated_widget.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({super.key});

  Widget _introduce(ColorScheme colorScheme, TextTheme textTheme) {
    return SizedBox(

      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'I am',
                style: textTheme.displaySmall,
              ),
              Row(
                children: [
                  Text(
                    'Raihan',
                    style: textTheme.displayLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(Icons.support_agent_rounded),
                  const Icon(Icons.code_rounded),
                ],
              ),
            ],
          ),
          Container(
            width: 210,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              height: 2,
              thickness: 4,
              indent: 0,
              endIndent: 10,
              color: colorScheme.primary.withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: 30,

            child: AnimatedTextKit(
              pause: const Duration(milliseconds: 20),
              repeatForever: true,
              animatedTexts: [
                RotateAnimatedText('Technical Consultant',
                alignment: Alignment.centerLeft,
                    duration: const Duration(milliseconds: 1000),
                    transitionHeight: 30),
                RotateAnimatedText('Multi-Platform Developer',
                alignment: Alignment.centerLeft,
                    duration: const Duration(milliseconds: 1000),
                    transitionHeight: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageProfile(ColorScheme colorScheme, TextTheme textTheme) {
    return SizedBox(

      width: 250,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: colorScheme.primary.withOpacity(0.03),
                  border: Border.all(
                    width: 3,
                    color: colorScheme.onSurface.withOpacity(0.05),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(360),
                    topRight: Radius.circular(360),
                    bottomLeft: Radius.circular(64),
                    bottomRight: Radius.circular(180),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Image(
              image: AssetImage('images/profile-nobg-cropped.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _moto(ColorScheme colorScheme, TextTheme textTheme) {
    List<Color> colorize = [
      colorScheme.onSurface.withOpacity(0.8),
      colorScheme.onSurface,
      colorScheme.onSurface.withOpacity(0.5),
      colorScheme.onSurface.withOpacity(0.4),
    ];
    return SizedBox(

      width: 400,
      child: CustomSectionAnimatedWidget(
        title: 'Services',
        animatedTexts: [
          ColorizeAnimatedText(
              'I empower seamless, cross-platform solutions and offer top-notch IT support for a connected world.',
              speed: const Duration(milliseconds: 100),
              textStyle: textTheme.bodyLarge!
                  .copyWith(color: colorScheme.primary.withOpacity(0.2)),
              colors: colorize,
              textAlign: TextAlign.left)
        ],
        actions: [
          FilledButton.tonalIcon(
            onPressed: () {},
            icon: const Icon(Icons.email_outlined),
            label: const Text('Contact Me'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: 32,
      alignment: WrapAlignment.start,
      children: [
        _introduce(colorScheme, textTheme),
    
        _imageProfile(colorScheme, textTheme),
        _moto(colorScheme, textTheme),
      ],
    );
  }
}
