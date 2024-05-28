import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:github_io_0x7han/provider/key_provider.dart';
import 'package:github_io_0x7han/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomContainerWidget extends StatelessWidget {

  final List<Widget> children;
  const CustomContainerWidget(
      {super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;

    final ThemeProvider read = context.read<ThemeProvider>();
    final ThemeProvider watch = context.watch<ThemeProvider>();

    bool isHover = watch.hoverSection == key ? true : false;

    bool isNotHover = watch.hoverSection != null && watch.hoverSection != key;

    return MouseRegion(
      onEnter: (event) {
        read.setHover(HoverEnum.section, key);
        print('Masuk $key');
      },
      onExit: (event) {
        read.setHover(HoverEnum.section, null);
        print('Keluar $key');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 32),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Easing.legacyDecelerate,
                    decoration: BoxDecoration(
                      color: isHover
                          ? colorScheme.surface.withOpacity(0.4)
                          : isNotHover
                              ? Colors.transparent
                              : colorScheme.secondaryContainer.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(isHover ? 42 : 32),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.all(32),
              child: KeyProvider(
                key: key,
                child: Column(
                  children: children,
                ),
              ),
            ),
            isNotHover
                ? ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 1,
                        sigmaY: 1,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        curve: Easing.legacyDecelerate,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(isHover ? 42 : 32),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
