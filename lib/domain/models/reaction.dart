class Reaction {
  final int id;
  final String type; // e.g., 'like', 'love', 'haha', etc.
  final DateTime createdAt;

  Reaction({
    required this.id,
    required this.type,
    required this.createdAt,
  });
}