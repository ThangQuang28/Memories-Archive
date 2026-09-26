import 'package:flutter/material.dart';

class MemorySlideController extends ChangeNotifier {
  MemorySlideController({int initialIndex = 0}) : _currentIndex = initialIndex;

  PageController? _pageController;
  int _currentIndex;
  int _pageCount = 0;
  bool _isAnimating = false;
  bool _reducedMotion = false;

  int get currentIndex => _currentIndex;

  int get pageCount => _pageCount;

  bool get isAnimating => _isAnimating;

  bool get reducedMotion => _reducedMotion;

  void attach({
    required PageController pageController,
    required int pageCount,
    required bool reducedMotion,
  }) {
    _pageController = pageController;
    _pageCount = pageCount;
    _reducedMotion = reducedMotion;
  }

  void updateReducedMotion(bool reducedMotion) {
    _reducedMotion = reducedMotion;
  }

  Future<void> next() async {
    await goToPage(_currentIndex + 1);
  }

  Future<void> previous() async {
    await goToPage(_currentIndex - 1);
  }

  Future<void> goToPage(int index) async {
    final PageController? pageController = _pageController;

    if (pageController == null ||
        !pageController.hasClients ||
        _isAnimating ||
        index < 0 ||
        index >= _pageCount ||
        index == _currentIndex) {
      return;
    }

    _isAnimating = true;
    notifyListeners();

    try {
      if (_reducedMotion) {
        pageController.jumpToPage(index);
      } else {
        await pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 520),
          curve: Curves.easeInOutCubic,
        );
      }

      _currentIndex = index;
      notifyListeners();
    } finally {
      _isAnimating = false;
      notifyListeners();
    }
  }

  void handlePageChanged(int index) {
    if (_currentIndex == index) {
      return;
    }

    _currentIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController = null;
    super.dispose();
  }
}
