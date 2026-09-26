import 'package:flutter/widgets.dart';

import 'app/app.dart';
import 'app/app_bootstrap.dart';
import 'app/app_dependencies.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    final AppDependencies dependencies =
        await bootstrapApplication();

    runApp(
        MemoryArchiveApp(
            dependencies: dependencies,
        ),
    );
}