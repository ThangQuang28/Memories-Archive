import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_motion.dart';
import 'widgets/intro_content.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _opacityAnimation;
  late final Animation<Offset> _contentOffsetAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: AppMotion.slow,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _contentOffsetAnimation =
        Tween<Offset>(begin: const Offset(0, 0.035), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _enterArchive() {
    if (!mounted) {
      return;
    }

    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final bool reduceMotion =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    if (reduceMotion) {
      return Scaffold(
        body: IntroContent(
          opacity: 1,
          contentOffset: Offset.zero,
          onEnter: _enterArchive,
        ),
      );
    }

    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return IntroContent(
            opacity: _opacityAnimation.value,
            contentOffset: _contentOffsetAnimation.value,
            onEnter: _enterArchive,
          );
        },
      ),
    );
  }
}
