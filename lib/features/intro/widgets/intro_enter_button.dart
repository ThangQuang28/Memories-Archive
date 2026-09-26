import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_motion.dart';

class IntroEnterButton extends StatefulWidget {
  const IntroEnterButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  State<IntroEnterButton> createState() => _IntroEnterButtonState();
}

class _IntroEnterButtonState extends State<IntroEnterButton> {
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    final bool highlighted = _isHovered || _isFocused;

    return FocusableActionDetector(
      onShowFocusHighlight: (bool value) {
        if (!mounted) {
          return;
        }

        setState(() {
          _isFocused = value;
        });
      },
      mouseCursor: SystemMouseCursors.click,
      onShowHoverHighlight: (bool value) {
        if (!mounted) {
          return;
        }

        setState(() {
          _isHovered = value;
        });
      },
      child: Semantics(
        button: true,
        label: 'Enter memory archive',
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: reduceMotion ? Duration.zero : AppMotion.fast,
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
              color: highlighted ? AppColors.foreground : Colors.transparent,
              border: Border.all(color: AppColors.foreground),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AnimatedDefaultTextStyle(
                  duration: reduceMotion ? Duration.zero : AppMotion.fast,
                  style:
                      Theme.of(context).textTheme.labelLarge ??
                      const TextStyle(),
                  child: Text(
                    'ENTER ARCHIVE',
                    style: TextStyle(
                      color: highlighted
                          ? AppColors.surfaceElevated
                          : AppColors.foreground,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Icon(
                  Icons.arrow_forward,
                  size: 17,
                  color: highlighted
                      ? AppColors.surfaceElevated
                      : AppColors.foreground,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
