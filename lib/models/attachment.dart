enum AttachmentType { image, audio, video, document }

enum AttachmentSource { local, remote, generated }

class AttachmentMetadata {
  const AttachmentMetadata({
    this.fileName,
    this.mimeType,
    this.size,
    this.sourceUri,
    this.thumbnailUri,
    this.duration,
    this.width,
    this.height,
    this.checksum,
  });

  final String? fileName;
  final String? mimeType;
  final int? size;
  final String? sourceUri;
  final String? thumbnailUri;
  final Duration? duration;
  final int? width;
  final int? height;
  final String? checksum;
}

class Attachment {
  const Attachment({
    required this.id,
    required this.type,
    required this.source,
    this.thumbnail,
    this.title,
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final AttachmentType type;
  final AttachmentSource source;
  final String? thumbnail;
  final String? title;
  final AttachmentMetadata? metadata;
  final DateTime createdAt;
  final DateTime updatedAt;
}
