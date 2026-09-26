import '../../../../models/memory.dart';

abstract interface class MemoryDataSource {
  Future<List<Memory>> getAll();

  Future<Memory?> getById(String id);

  Future<Memory> create(Memory memory);

  Future<Memory> update(Memory memory);

  Future<void> delete(String id);
}

class MockMemoryDataSource implements MemoryDataSource {
  MockMemoryDataSource({List<Memory> initialMemories = const <Memory>[]})
    : _memories = List<Memory>.from(initialMemories);

  final List<Memory> _memories;

  @override
  Future<List<Memory>> getAll() async {
    return List<Memory>.unmodifiable(_memories);
  }

  @override
  Future<Memory?> getById(String id) async {
    for (final Memory memory in _memories) {
      if (memory.id == id) {
        return memory;
      }
    }

    return null;
  }

  @override
  Future<Memory> create(Memory memory) async {
    final bool exists = _memories.any((Memory item) => item.id == memory.id);

    if (exists) {
      throw StateError('Memory with id "${memory.id}" already exists.');
    }

    _memories.add(memory);
    return memory;
  }

  @override
  Future<Memory> update(Memory memory) async {
    final int index = _memories.indexWhere(
      (Memory item) => item.id == memory.id,
    );

    if (index == -1) {
      throw StateError('Memory with id "${memory.id}" was not found.');
    }

    _memories[index] = memory;
    return memory;
  }

  @override
  Future<void> delete(String id) async {
    final int index = _memories.indexWhere((Memory item) => item.id == id);

    if (index == -1) {
      throw StateError('Memory with id "$id" was not found.');
    }

    _memories.removeAt(index);
  }
}
