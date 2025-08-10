class Comment {
  final int id;
  final String text;
  final DateTime createdAt;
  final String authorName;

  Comment({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.authorName,
  });

  // A method to convert a Comment object into a Map for database storage.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'createdAt': createdAt.toIso8601String(),
      'authorName': authorName,
    };
  }

  // A factory constructor to create a Comment object from a Map.
  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'],
      text: map['text'],
      createdAt: DateTime.parse(map['createdAt']),
      authorName: map['authorName'],
    );
  }

}