import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import 'widgets/memory_slide_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MemorySlideView(
      slides: const <Widget>[
        _PlaceholderSlide(index: '01', title: 'COVER'),
        _PlaceholderSlide(index: '02', title: 'PEOPLE'),
        _PlaceholderSlide(index: '03', title: 'GALLERY'),
        _PlaceholderSlide(index: '04', title: 'CALENDAR'),
        _PlaceholderSlide(index: '05', title: 'COUNTER'),
        _PlaceholderSlide(index: '06', title: 'NOTES'),
        _PlaceholderSlide(index: '07', title: 'MUSIC'),
        _PlaceholderSlide(index: '08', title: 'ARCHIVE'),
      ],
    );
  }
}

class _PlaceholderSlide extends StatelessWidget {
  const _PlaceholderSlide({required this.index, required this.title});

  final String index;
  final String title;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return ColoredBox(
      color: AppColors.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  index,
                  style: textTheme.labelLarge?.copyWith(
                    color: AppColors.foregroundMuted,
                  ),
                ),
              ),
              Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textTheme.displayLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
