import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_io_0x7han/provider/theme_provider.dart';
import 'package:github_io_0x7han/view/widget/custom_chip_widget.dart';
import 'package:provider/provider.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget prefix;
  final List<Widget> suffix;
  const CustomCardWidget(
      {super.key, required this.prefix, required this.suffix});

  @override
  Widget build(BuildContext context) {
        final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final ThemeProvider read = context.read<ThemeProvider>();
    final ThemeProvider watch = context.watch<ThemeProvider>();


    bool isHover = watch.hoverCardExperience == key ? true : false;

    bool isNotHover = watch.hoverCardExperience != null && watch.hoverCardExperience != key;


    return MouseRegion(
            onEnter: (event) {
        read.setHover(HoverEnum.cardExperience, key);
        print('Masuk $key');
      },
      onExit: (event) {
        read.setHover(HoverEnum.cardExperience, null);
        print('Keluar $key');
      },
      child: Stack(
        children: [
          Padding(
            padding:  const EdgeInsets.all(16),
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 16,
              runSpacing: 16,
              children: [
                SizedBox(width: 200, child: prefix),

                SizedBox(
                  width: 688,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: suffix,
                  ),
                ),
              ],
            ),
          ),
          if (isNotHover)
            Positioned.fill(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  static CustomCardWidget experience(
    Key? key,
    BuildContext context,
      {required String date,
      required String type,
      required String place,
      required String role,
      required String description,
      required List<String> chips}) {
        final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final ThemeProvider read = context.read<ThemeProvider>();
    final ThemeProvider watch = context.watch<ThemeProvider>();


    bool isHover = watch.hoverCardExperience == key ? true : false;

    bool isNotHover = watch.hoverCardExperience != null && watch.hoverCardExperience != key;

    Color? isNotHoverColor = colorScheme.onSurface.withOpacity(0.3);

    return CustomCardWidget(
      key: key,
      prefix: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
          type,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: isNotHover ? isNotHoverColor : colorScheme.primary.withOpacity(0.7)),
        ),
          Text(
            date,
            style: TextStyle(fontSize: 13,color: isNotHover ? isNotHoverColor : null),
          ),
        ],
      ),
      suffix: [

        Text(
          place,
          style: TextStyle(fontWeight: FontWeight.bold, color: isNotHover ? isNotHoverColor : null),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            role,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isNotHover ? isNotHoverColor : colorScheme.onSurface.withOpacity(0.4)),
          ),
        ),
        Text(description, style: TextStyle( color: isNotHover ? isNotHoverColor : null),),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: chips.map((e) {
              return CustomChipWidget(label: e);
            }).toList(),
          ),
        ),
      ],
    );
  }

  static CustomCardWidget project(
      {required Widget prefix, required List<Widget> suffix}) {
    return CustomCardWidget(
      prefix: prefix,
      suffix: suffix,
    );
  }
}
