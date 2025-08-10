class Reaction {
  final int id;
  final String type; // e.g., 'like', 'love', 'haha', etc.
  final DateTime createdAt;

  Reaction({
    required this.id,
    required this.type,
    required this.createdAt,
  });

  // A method to convert a Reaction object into a Map for database storage.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // A factory constructor to create a Reaction object from a Map.
  factory Reaction.fromMap(Map<String, dynamic> map) {
    return Reaction(
      id: map['id'],
      type: map['type'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

}