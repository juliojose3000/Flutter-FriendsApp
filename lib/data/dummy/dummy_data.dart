import 'package:twitter_embed_card/domain/models/comment.dart';
import 'package:twitter_embed_card/domain/models/post.dart';
import 'package:twitter_embed_card/domain/models/reaction.dart';

class DummyData {

  static final List<Post> posts = [];

  static void populateDummyData() {
    // Add some dummy comments
    const postAuthorName = 'Andre Bizzotto';
    const postAuthorUsername = '@biz84';
    const postContent =
        'Did you know?\n\nWhen you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change. \n\nBut there is a better way that lets you depend only on the properties you care about (and minimize unnecesaary rebuilds)';
    final postImages = ['assets/media-query-banner.jpg'];
    const postAuthorPhoto = 'assets/andrea-avatar.png';

    // Parsing the date string from "10:21 AM · Jun 15, 2024"
    // Note: This is a simplified parsing. For robust production code,
    // you might use a package like `intl` for better date parsing.
    final postCreatedAt = DateTime(2024, 6, 15, 10, 21);

    // Creating placeholder lists based on the widget's content
    /*final postComments = List<Comment>.generate(
        12, (index) => Comment(id: 1, text: 'Comment #${index + 1}', createdAt: DateTime.now(), authorName: 'User${index + 1}'));*/

    final postComments = [Comment(authorName: "User1", text: "This is a comment", createdAt: DateTime.now(), id: 1),
        Comment(authorName: "User2", text: "Another comment", createdAt: DateTime.now(), id: 2)];

    final postReactions =
        List<Reaction>.generate(997, (index) => Reaction(id: 1, type: 'Like', createdAt: DateTime.now()));

    // Creating a new Post object with the extracted data.
    final myPost = Post(
      id: 'post-12345', // Placeholder ID
      userphoto: postAuthorPhoto,
      name: postAuthorName,
      username: postAuthorUsername,
      content: postContent,
      contentImages: postImages,
      createdAt: postCreatedAt,
      comments: postComments,
      reactions: postReactions,
    );

    posts.add(myPost);
    
  }
}
