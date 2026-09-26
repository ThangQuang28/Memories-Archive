import '../../models/memory.dart';
import 'memory_commands.dart';
import 'memory_queries.dart';

class MemoryService {
  const MemoryService({required this._queries, required this._commands});

  final MemoryQueries _queries;
  final MemoryCommands _commands;

  Future<List<Memory>> getAll() {
    return _queries.getAll();
  }

  Future<Memory?> getById(String id) {
    return _queries.getbyId(id);
  }

  Future<List<Memory>> search(String query) {
    return _queries.search(query);
  }

  Future<List<Memory>> filter({
    MemoryType? type,
    bool? isFavorite,
    String? location,
    String? tag,
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    return _queries.filter(
      type: type,
      isFavorite: isFavorite,
      location: location,
      tag: tag,
      fromDate: fromDate,
      toDate: toDate,
    );
  }

  Future<List<Memory>> getBydate(DateTime date) {
    return _queries.getByDate(date);
  }

  Future<List<Memory>> getFavorite() {
    return _queries.getFavorites();
  }

  Future<List<Memory>> getOnThisDay(DateTime date) {
    return _queries.getOnThisDay(date);
  }

  Future<List<Memory>> getTimeline() {
    return _queries.getTimeline();
  }

  Future<Memory> create(Memory memory) {
    return _commands.create(memory);
  }

  Future<Memory> update(Memory memory) {
    return _commands.update(memory);
  }

  Future<void> delete(String id) {
    return _commands.delete(id);
  }
}
