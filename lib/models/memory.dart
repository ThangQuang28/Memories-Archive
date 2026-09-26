enum MemoryType { photo, note, event, music, mixed }

class Memory {
  const Memory({
    required this.id,
    required this.title,
    this.description,
    required this.date,
    required this.type,
    this.coverAttachmentId,
    this.personIds = const <String>[],
    this.attachmentIds = const <String>[],
    this.tags = const <String>[],
    this.location,
    this.isFavorite = false,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String? description;
  final DateTime date;
  final MemoryType type;
  final String? coverAttachmentId;
  final List<String> personIds;
  final List<String> attachmentIds;
  final List<String> tags;
  final String? location;
  final bool isFavorite;
  final DateTime createdAt;
  final DateTime updatedAt;

  Memory copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    MemoryType? type,
    String? coverAttachmentId,
    List<String>? personIds,
    List<String>? attachmentIds,
    List<String>? tags,
    String? location,
    bool? isFavorite,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Memory(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      type: type ?? this.type,
      coverAttachmentId: coverAttachmentId ?? this.coverAttachmentId,
      personIds: List<String>.unmodifiable(personIds ?? this.personIds),
      attachmentIds: List<String>.unmodifiable(
        attachmentIds ?? this.attachmentIds,
      ),
      tags: List<String>.unmodifiable(tags ?? this.tags),
      location: location ?? this.location,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
