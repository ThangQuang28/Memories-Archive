import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import 'intro_enter_button.dart';

class IntroContent extends StatelessWidget {
  const IntroContent({
    required this.opacity,
    required this.contentOffset,
    required this.onEnter,
    super.key,
  });

  final double opacity;
  final Offset contentOffset;
  final VoidCallback onEnter;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final Size size = MediaQuery.sizeOf(context);

    final bool isCompact = size.width < 700;

    final double horizontalPadding = isCompact ? 28 : 64;
    final double titleSize = isCompact ? 52 : 96;
    final double archiveSize = isCompact ? 48 : 88;

    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isCompact ? 28 : 48,
          ),
          child: Column(
            children: <Widget>[
              _IntroHeader(isCompact: isCompact, textTheme: textTheme),
              Expanded(
                child: Center(
                  child: FractionalTranslation(
                    translation: contentOffset,
                    child: Opacity(
                      opacity: opacity,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1100),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'MEMORY',
                              style: textTheme.displayLarge?.copyWith(
                                fontSize: titleSize,
                                height: 0.88,
                                letterSpacing: -3.0,
                              ),
                            ),
                            Text(
                              'ARCHIVE',
                              style: textTheme.displayLarge?.copyWith(
                                fontSize: archiveSize,
                                height: 0.9,
                                letterSpacing: -2.5,
                              ),
                            ),
                            SizedBox(height: isCompact ? 28 : 40),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 460),
                              child: Text(
                                'A place for moments, people, '
                                'places and stories worth remembering.',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: AppColors.foregroundMuted,
                                ),
                              ),
                            ),
                            SizedBox(height: isCompact ? 36 : 48),
                            IntroEnterButton(onPressed: onEnter),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _IntroFooter(isCompact: isCompact, textTheme: textTheme),
            ],
          ),
        ),
      ),
    );
  }
}

class _IntroHeader extends StatelessWidget {
  const _IntroHeader({required this.isCompact, required this.textTheme});

  final bool isCompact;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'MA / 01',
          style: textTheme.labelLarge?.copyWith(
            color: AppColors.foregroundMuted,
          ),
        ),
        if (!isCompact)
          Text(
            'PERSONAL MEMORY ARCHIVE',
            style: textTheme.labelLarge?.copyWith(
              color: AppColors.foregroundMuted,
            ),
          ),
      ],
    );
  }
}

class _IntroFooter extends StatelessWidget {
  const _IntroFooter({required this.isCompact, required this.textTheme});

  final bool isCompact;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(
            'KEEP THE MOMENTS THAT MATTER.',
            style: textTheme.labelLarge?.copyWith(
              color: AppColors.foregroundSubtle,
            ),
          ),
        ),
        if (!isCompact)
          Text(
            'SCROLL TO EXPLORE',
            style: textTheme.labelLarge?.copyWith(
              color: AppColors.foregroundSubtle,
            ),
          ),
      ],
    );
  }
}
