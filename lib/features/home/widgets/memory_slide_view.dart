import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';

import 'memory_slide_controller.dart';

class MemorySlideView extends StatefulWidget {
  const MemorySlideView({required this.slides, this.controller, super.key});

  final List<Widget> slides;
  final MemorySlideController? controller;

  @override
  State<MemorySlideView> createState() => _MemorySlideViewState();
}

class _MemorySlideViewState extends State<MemorySlideView> {
  late final PageController _pageController;

  late MemorySlideController _controller;

  bool _ownsController = false;

  @override
  void initState() {
    super.initState();

    _ownsController = widget.controller == null;
    _controller = widget.controller ?? MemorySlideController();

    _pageController = PageController(initialPage: _controller.currentIndex);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _attachController();
  }

  @override
  void didUpdateWidget(covariant MemorySlideView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller == widget.controller) {
      return;
    }

    if (_ownsController) {
      _controller.dispose();
    }

    _ownsController = widget.controller == null;
    _controller = widget.controller ?? MemorySlideController();

    _attachController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    if (_ownsController) {
      _controller.dispose();
    }

    super.dispose();
  }

  void _attachController() {
    final bool reducedMotion =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    _controller.attach(
      pageController: _pageController,
      pageCount: widget.slides.length,
      reducedMotion: reducedMotion,
    );
  }

  void _handlePointerSignal(PointerSignalEvent event) {
    if (event is! PointerScrollEvent) {
      return;
    }

    if (event.scrollDelta.dy > 0) {
      _controller.next();
      return;
    }

    if (event.scrollDelta.dy < 0) {
      _controller.previous();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.slides.isEmpty) {
      return const SizedBox.shrink();
    }

    final bool reducedMotion =
        MediaQuery.maybeOf(context)?.disableAnimations ?? false;

    _controller.updateReducedMotion(reducedMotion);

    return Focus(
      autofocus: true,
      child: CallbackShortcuts(
        bindings: <ShortcutActivator, VoidCallback>{
          const SingleActivator(LogicalKeyboardKey.arrowDown): _controller.next,
          const SingleActivator(LogicalKeyboardKey.pageDown): _controller.next,
          const SingleActivator(LogicalKeyboardKey.arrowUp):
              _controller.previous,
          const SingleActivator(LogicalKeyboardKey.pageUp):
              _controller.previous,
          const SingleActivator(LogicalKeyboardKey.home): () =>
              _controller.goToPage(0),
          const SingleActivator(LogicalKeyboardKey.end): () =>
              _controller.goToPage(widget.slides.length - 1),
        },
        child: Listener(
          onPointerSignal: _handlePointerSignal,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            physics: const PageScrollPhysics(),
            itemCount: widget.slides.length,
            onPageChanged: _controller.handlePageChanged,
            itemBuilder: (BuildContext context, int index) {
              return RepaintBoundary(
                child: SizedBox.expand(child: widget.slides[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
