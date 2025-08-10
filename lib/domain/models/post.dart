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

}