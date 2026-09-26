import 'dart:js_interop';

import '../../../models/memory.dart';

abstract final class MemoryRecordMapper {
  static Map<String, Object?> toRecord(Memory memory) {
    return <String, Object?>{
      'id': memory.id,
      'title': memory.title,
      'description': memory.description,
      'date': memory.date.toIso8601String(),
      'type': memory.type.name,
      'coverAttachmentId': memory.coverAttachmentId,
      'personIds': List<String>.from(memory.personIds),
      'attachmentIds': List<String>.from(memory.attachmentIds),
      'tags': List<String>.from(memory.tags),
      'location': memory.location,
      'isFavorite': memory.isFavorite,
      'createdAt': memory.createdAt.toIso8601String(),
      'updatedAt': memory.updatedAt.toIso8601String(),
    };
  }

  static JSAny toStorageValue(Memory memory) {
    final JSAny? value = toRecord(memory).jsify();

    if (value == null) {
      throw StateError('Failed to convert Memory record to JavaScript value.');
    }

    return value;
  }

  static Memory fromStorageValue(Object value) {
    final Object? dartValue = (value as JSAny).dartify();

    if (dartValue is! Map) {
      throw FormatException(
        'Invalid Memory record type: '
        '${dartValue.runtimeType}.',
      );
    }

    final Map<Object?, Object?> record = dartValue;

    return Memory(
      id: _requiredString(record, 'id'),
      title: _requiredString(record, 'title'),
      description: _nullableString(record, 'description'),
      date: _requiredDateTime(record, 'date'),
      type: _memoryType(record, 'type'),
      coverAttachmentId: _nullableString(record, 'coverAttachmentId'),
      personIds: _stringList(record, 'personIds'),
      attachmentIds: _stringList(record, 'attachmentIds'),
      tags: _stringList(record, 'tags'),
      location: _nullableString(record, 'location'),
      isFavorite: _boolValue(record, 'isFavorite'),
      createdAt: _requiredDateTime(record, 'createdAt'),
      updatedAt: _requiredDateTime(record, 'updatedAt'),
    );
  }

  static String _requiredString(Map<Object?, Object?> record, String key) {
    final Object? value = record[key];

    if (value is! String || value.isEmpty) {
      throw FormatException('Memory field "$key" must be a non-empty String.');
    }

    return value;
  }

  static String? _nullableString(Map<Object?, Object?> record, String key) {
    final Object? value = record[key];

    if (value == null) {
      return null;
    }

    if (value is! String) {
      throw FormatException('Memory field "$key" must be a String or null.');
    }

    return value;
  }

  static DateTime _requiredDateTime(Map<Object?, Object?> record, String key) {
    final String value = _requiredString(record, key);

    try {
      return DateTime.parse(value);
    } on FormatException {
      throw FormatException(
        'Memory field "$key" contains an invalid DateTime.',
      );
    }
  }

  static MemoryType _memoryType(Map<Object?, Object?> record, String key) {
    final String value = _requiredString(record, key);

    try {
      return MemoryType.values.byName(value);
    } on ArgumentError {
      throw FormatException('Unknown MemoryType "$value".');
    }
  }

  static List<String> _stringList(Map<Object?, Object?> record, String key) {
    final Object? value = record[key];

    if (value is! List) {
      throw FormatException('Memory field "$key" must be a List.');
    }

    final List<String> result = <String>[];

    for (final Object? item in value) {
      if (item is! String) {
        throw FormatException(
          'Memory field "$key" contains a non-String value.',
        );
      }

      result.add(item);
    }

    return List<String>.unmodifiable(result);
  }

  static bool _boolValue(Map<Object?, Object?> record, String key) {
    final Object? value = record[key];

    if (value is! bool) {
      throw FormatException('Memory field "$key" must be a bool.');
    }

    return value;
  }
}
