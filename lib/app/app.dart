import 'package:flutter/material.dart';

import 'app_dependencies.dart';
import 'router.dart';
import 'theme/app_theme.dart';

class MemoryArchiveApp extends StatelessWidget {
  const MemoryArchiveApp({required this.dependencies, super.key});

  final AppDependencies dependencies;

  @override
  Widget build(BuildContext context) {
    return AppDependenciesScope(
      dependencies: dependencies,
      child: MaterialApp.router(
        title: 'MEMORY ARCHIVE',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        routerConfig: appRouter,
      ),
    );
  }
}

class AppDependenciesScope extends InheritedWidget {
  const AppDependenciesScope({
    required this.dependencies,
    required super.child,
    super.key,
  });

  final AppDependencies dependencies;

  static AppDependencies of(BuildContext context) {
    final AppDependenciesScope? scope = context
        .dependOnInheritedWidgetOfExactType<AppDependenciesScope>();

    assert(
      scope != null,
      'AppDependenciesScope was not found in the widget tree.',
    );

    return scope!.dependencies;
  }

  static AppDependencies read(BuildContext context) {
    final AppDependenciesScope? scope = context
        .getInheritedWidgetOfExactType<AppDependenciesScope>();

    assert(
      scope != null,
      'AppDependenciesScope was not found in the widget tree.',
    );

    return scope!.dependencies;
  }

  @override
  bool updateShouldNotify(AppDependenciesScope oldWidget) {
    return dependencies != oldWidget.dependencies;
  }
}
