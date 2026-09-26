import '../../models/memory.dart';
import '../datasources/mock/mock_memory_data_source.dart';
import 'memory_repositories.dart';

class MemoryRepositoryImpl implements MemoryRepository {
  const MemoryRepositoryImpl({required this._dataSource});

  final MemoryDataSource _dataSource;

  @override
  Future<List<Memory>> getAll() async {
    return _dataSource.getAll();
  }

  @override
  Future<Memory?> getById(String id) async {
    return _dataSource.getById(id);
  }

  @override
  Future<Memory> create(Memory memory) async {
    return _dataSource.create(memory);
  }

  @override
  Future<Memory> update(Memory memory) async {
    return _dataSource.update(memory);
  }

  @override
  Future<void> delete(String id) async {
    await _dataSource.delete(id);
  }

  @override
  Future<List<Memory>> search(String query) async {
    final String normalizedQuery = query.trim().toLowerCase();

    if (normalizedQuery.isEmpty) {
      return getAll();
    }

    final List<Memory> memories = await _dataSource.getAll();

    return memories
        .where((Memory memory) {
          final String title = memory.title.toLowerCase();
          final String description = memory.description?.toLowerCase() ?? '';
          final String location = memory.location?.toLowerCase() ?? '';

          final bool tagMatches = memory.tags.any(
            (String tag) => tag.toLowerCase().contains(normalizedQuery),
          );

          return title.contains(normalizedQuery) ||
              description.contains(normalizedQuery) ||
              location.contains(normalizedQuery) ||
              tagMatches;
        })
        .toList(growable: false);
  }

  @override
  Future<List<Memory>> filter({
    MemoryType? type,
    bool? isFavorite,
    String? location,
    String? tag,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    final List<Memory> memories = await _dataSource.getAll();

    final String? normalizedLocation = location?.trim().toLowerCase();

    final String? normalizedTag = tag?.trim().toLowerCase();

    return memories
        .where((Memory memory) {
          if (type != null && memory.type != type) {
            return false;
          }

          if (isFavorite != null && memory.isFavorite != isFavorite) {
            return false;
          }

          if (normalizedLocation != null && normalizedLocation.isNotEmpty) {
            final String memoryLocation = memory.location?.toLowerCase() ?? '';

            if (!memoryLocation.contains(normalizedLocation)) {
              return false;
            }
          }

          if (normalizedTag != null && normalizedTag.isNotEmpty) {
            final bool matchesTag = memory.tags.any(
              (String memoryTag) =>
                  memoryTag.toLowerCase().contains(normalizedTag),
            );

            if (!matchesTag) {
              return false;
            }
          }

          if (fromDate != null &&
              _dateOnly(memory.date).isBefore(_dateOnly(fromDate))) {
            return false;
          }

          if (toDate != null &&
              _dateOnly(memory.date).isAfter(_dateOnly(toDate))) {
            return false;
          }

          return true;
        })
        .toList(growable: false);
  }

  @override
  Future<List<Memory>> getByDate(DateTime date) async {
    final DateTime targetDate = _dateOnly(date);
    final List<Memory> memories = await _dataSource.getAll();

    return memories
        .where((Memory memory) {
          return _dateOnly(memory.date) == targetDate;
        })
        .toList(growable: false);
  }

  @override
  Future<List<Memory>> getFavorites() async {
    final List<Memory> memories = await _dataSource.getAll();

    return memories
        .where((Memory memory) => memory.isFavorite)
        .toList(growable: false);
  }

  @override
  Future<List<Memory>> getOnThisDay(DateTime date) async {
    final List<Memory> memories = await _dataSource.getAll();

    return memories
        .where((Memory memory) {
          return memory.date.month == date.month &&
              memory.date.day == date.day &&
              memory.date.year != date.year;
        })
        .toList(growable: false);
  }

  @override
  Future<List<Memory>> getTimeline() async {
    final List<Memory> memories = List<Memory>.from(await _dataSource.getAll());

    memories.sort(
      (Memory first, Memory second) => second.date.compareTo(first.date),
    );

    return List<Memory>.unmodifiable(memories);
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
