import 'package:indexed_db/indexed_db.dart' as idb;

abstract final class MemoryDatabase {
  static const String name = 'memory_archive';
  static const int version = 1;
  static const String memoriesStore = 'memories';

  static Future<idb.Database> open() {
    if (!idb.IdbFactory.supported) {
      throw UnsupportedError('IndexedDB is not supported by this platform.');
    }

    final idb.IdbFactory factory = idb.IdbFactory();

    return factory.open(
      name,
      version: version,
      onUpgradeNeeded: (idb.VersionChangeEvent event) {
        final idb.Database database = event.target.result as idb.Database;

        final List<String> storeNames = database.objectStoreNames ?? <String>[];

        if (!storeNames.contains(memoriesStore)) {
          database.createObjectStore(memoriesStore);
        }
      },
    );
  }
}
