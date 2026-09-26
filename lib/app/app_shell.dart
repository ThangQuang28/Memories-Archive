import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(child: child),
          const _GlobalLayer(),
        ],
      ),
    );
  }
}

class _GlobalLayer extends StatelessWidget {
  const _GlobalLayer();

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: Stack(
        children: <Widget>[
          _MusicPlayerHost(),
          _SearchOverlayHost(),
          _ModelHost(),
          _NotificationHost(),
        ],
      ),
    );
  }
}

class _MusicPlayerHost extends StatelessWidget {
  const _MusicPlayerHost();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _SearchOverlayHost extends StatelessWidget {
  const _SearchOverlayHost();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _ModelHost extends StatelessWidget {
  const _ModelHost();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _NotificationHost extends StatelessWidget {
  const _NotificationHost();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
