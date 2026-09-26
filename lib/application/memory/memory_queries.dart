import '../../data/repositories/memory_repositories.dart';
import '../../models/memory.dart';

class MemoryQueries {
  const MemoryQueries({required this._repository});

  final MemoryRepository _repository;

  Future<List<Memory>> getAll() {
    return _repository.getAll();
  }

  Future<Memory?> getbyId(String id) {
    return _repository.getById(id);
  }

  Future<List<Memory>> search(String querry) {
    return _repository.search(querry);
  }

  Future<List<Memory>> filter({
    MemoryType? type,
    bool? isFavorite,
    String? location,
    String? tag,
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    return _repository.filter(
      type: type,
      isFavorite: isFavorite,
      location: location,
      tag: tag,
      fromDate: fromDate,
      toDate: toDate,
    );
  }

  Future<List<Memory>> getByDate(DateTime date) {
    return _repository.getByDate(date);
  }

  Future<List<Memory>> getFavorites() {
    return _repository.getFavorites();
  }

  Future<List<Memory>> getOnThisDay(DateTime date) {
    return _repository.getOnThisDay(date);
  }

  Future<List<Memory>> getTimeline() {
    return _repository.getTimeline();
  }
}
