import 'dart:convert';

import 'package:twitter_embed_card/domain/models/comment.dart';
import 'package:twitter_embed_card/domain/models/reaction.dart';

class Post {
  final String id;
  final String userphoto;
  final String name;
  final String username;
  final String content;
  final List<String> contentImages;
  final DateTime createdAt;
  final List<Comment> comments;
  final List<Reaction> reactions;

  Post({
    required this.id,
    required this.userphoto,
    required this.name,
    required this.username,
    required this.content,
    required this.contentImages,
    required this.createdAt,
    required this.comments,
    required this.reactions,
  });

  // Method to convert a Post object into a Map for database storage.
  // We use JSON encoding to store lists of objects as a single TEXT field.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'userphoto': userphoto,
      'content': content,
      'contentImages': jsonEncode(contentImages), // Encode as JSON string
      'createdAt': createdAt.toIso8601String(),
      'comments': jsonEncode(comments.map((c) => c.toMap()).toList()), // Encode list of maps as JSON
      'reactions': jsonEncode(reactions.map((r) => r.toMap()).toList()), // Encode list of maps as JSON
    };
  }

  // A factory constructor to create a Post object from a Map retrieved from the database.
  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      userphoto: map['userphoto'],
      content: map['content'],
      contentImages: List<String>.from(jsonDecode(map['contentImages'])), // Decode JSON back to List<String>
      createdAt: DateTime.parse(map['createdAt']),
      comments: List<Comment>.from(jsonDecode(map['comments']).map((x) => Comment.fromMap(x))), // Decode and map to Comment objects
      reactions: List<Reaction>.from(jsonDecode(map['reactions']).map((x) => Reaction.fromMap(x))), // Decode and map to Reaction objects
    );
  }
}
