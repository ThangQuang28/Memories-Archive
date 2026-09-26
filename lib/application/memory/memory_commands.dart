import '../../data/repositories/memory_repositories.dart';
import '../../models/memory.dart';

class MemoryCommands {
  const MemoryCommands({required this._repository});

  final MemoryRepository _repository;

  Future<Memory> create(Memory memory) {
    return _repository.create(memory);
  }

  Future<Memory> update(Memory memory) {
    return _repository.update(memory);
  }

  Future<void> delete(String id) {
    return _repository.delete(id);
  }
}
