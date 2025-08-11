import 'package:sqflite/sql.dart';
import 'package:twitter_embed_card/data/local/local_database.dart';
import 'package:twitter_embed_card/domain/models/post.dart';

// Corrected PostsDao class.
class PostsDao {
  // A method to insert a post into the database.
  Future<void> insertPost(Post post) async {
    final db = await LocalDatabase.getDatabase();
    await db.insert(
      'post',
      post.toMap(), // Now the Post class has a toMap() method
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method to populate the database with a list of posts.
  Future<void> populateWithDummyData(List<Post> posts) async {
    final db = await LocalDatabase.getDatabase();
    await Future.wait(posts.map((post) async {
      await db.insert(
        'post',
        post.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }));
  }

  // A method to retrieve all posts from the database.
  Future<List<Post>> getPosts() async {
    final db = await LocalDatabase.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('post');

    await Future.delayed(const Duration(seconds: 3));
    
    // Now using the fromMap factory constructor to correctly deserialize the data.
    return List.generate(maps.length, (i) {
      return Post.fromMap(maps[i]);
    });
  }
}