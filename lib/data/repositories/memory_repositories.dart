import '../../models/memory.dart';

abstract interface class MemoryRepository {
  Future<List<Memory>> getAll();

  Future<Memory?> getById(String id);

  Future<Memory> create(Memory memory);

  Future<Memory> update(Memory memory);

  Future<void> delete(String id);

  Future<List<Memory>> search(String query);

  Future<List<Memory>> filter({
    MemoryType? type,
    bool? isFavorite,
    String? location,
    String? tag,
    DateTime? fromDate,
    DateTime? toDate,
  });

  Future<List<Memory>> getByDate(DateTime date);

  Future<List<Memory>> getFavorites();

  Future<List<Memory>> getOnThisDay(DateTime date);

  Future<List<Memory>> getTimeline();
}
