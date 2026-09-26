import 'package:indexed_db/indexed_db.dart' as idb;

import '../../../models/memory.dart';
import '../mock/mock_memory_data_source.dart';
import 'memory_database.dart';
import 'memory_record_mapper.dart';

class IndexedDbMemoryDataSource implements MemoryDataSource {
  IndexedDbMemoryDataSource();

  Future<idb.Database>? _databaseFuture;

  Future<idb.Database> _database() {
    return _databaseFuture ??= MemoryDatabase.open();
  }

  @override
  Future<List<Memory>> getAll() async {
    final idb.Database database = await _database();

    final idb.Transaction transaction = database.transactionList(<String>[
      MemoryDatabase.memoriesStore,
    ], 'readonly');

    final idb.ObjectStore store = transaction.objectStore(
      MemoryDatabase.memoriesStore,
    );

    final idb.Request request = store.getAll(null);

    await request.onSuccess.first;

    final dynamic result = request.result;

    await transaction.completed;

    if (result is! List) {
      throw StateError('IndexedDB returned an invalid memories result.');
    }

    final List<Memory> memories = <Memory>[];

    for (final Object record in result) {
      memories.add(MemoryRecordMapper.fromStorageValue(record));
    }

    return List<Memory>.unmodifiable(memories);
  }

  @override
  Future<Memory?> getById(String id) async {
    final idb.Database database = await _database();

    final idb.Transaction transaction = database.transactionList(<String>[
      MemoryDatabase.memoriesStore,
    ], 'readonly');

    final Object? record = await transaction
        .objectStore(MemoryDatabase.memoriesStore)
        .getObject(id);

    await transaction.completed;

    if (record == null) {
      return null;
    }

    return MemoryRecordMapper.fromStorageValue(record);
  }

  @override
  Future<Memory> create(Memory memory) async {
    final Memory? existing = await getById(memory.id);

    if (existing != null) {
      throw StateError('Memory with id "${memory.id}" already exists.');
    }

    final idb.Database database = await _database();

    final idb.Transaction transaction = database.transactionList(<String>[
      MemoryDatabase.memoriesStore,
    ], 'readwrite');

    await transaction
        .objectStore(MemoryDatabase.memoriesStore)
        .put(MemoryRecordMapper.toStorageValue(memory), memory.id);

    await transaction.completed;

    return memory;
  }

  @override
  Future<Memory> update(Memory memory) async {
    final Memory? existing = await getById(memory.id);

    if (existing == null) {
      throw StateError('Memory with id "${memory.id}" was not found.');
    }

    final idb.Database database = await _database();

    final idb.Transaction transaction = database.transactionList(<String>[
      MemoryDatabase.memoriesStore,
    ], 'readwrite');

    await transaction
        .objectStore(MemoryDatabase.memoriesStore)
        .put(MemoryRecordMapper.toStorageValue(memory), memory.id);

    await transaction.completed;

    return memory;
  }

  @override
  Future<void> delete(String id) async {
    final Memory? existing = await getById(id);

    if (existing == null) {
      throw StateError('Memory with id "$id" was not found.');
    }

    final idb.Database database = await _database();

    final idb.Transaction transaction = database.transactionList(<String>[
      MemoryDatabase.memoriesStore,
    ], 'readwrite');

    await transaction.objectStore(MemoryDatabase.memoriesStore).delete(id);

    await transaction.completed;
  }
}
