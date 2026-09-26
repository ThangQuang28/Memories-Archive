import '../application/memory/memory_commands.dart';
import '../application/memory/memory_queries.dart';
import '../application/memory/memory_service.dart';
import '../data/datasources/mock/mock_memory_data_source.dart';
import '../data/repositories/memory_repositories_impl.dart';
import 'app_dependencies.dart';

Future<AppDependencies> bootstrapApplication() async {
  final MemoryDataSource memoryDataSource = MockMemoryDataSource();

  final MemoryRepositoryImpl memoryRepository = MemoryRepositoryImpl(
    dataSource: memoryDataSource,
  );

  final MemoryQueries memoryQueries = MemoryQueries(
    repository: memoryRepository,
  );

  final MemoryCommands memoryCommands = MemoryCommands(
    repository: memoryRepository,
  );

  final MemoryService memoryService = MemoryService(
    queries: memoryQueries,
    commands: memoryCommands,
  );

  return AppDependencies(memoryService: memoryService);
}
