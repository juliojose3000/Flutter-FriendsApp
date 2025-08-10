import 'dart:async';

import 'package:flutter/material.dart';
import 'package:twitter_embed_card/data/dummy/dummy_data.dart';
import 'package:twitter_embed_card/data/local/posts_dao.dart';
import 'package:twitter_embed_card/domain/models/post.dart';
import 'package:twitter_embed_card/presentation/screens/main_screen.dart';

void main() async {

  FlutterError.onError = (FlutterErrorDetails details) {
    // Log or report the error
    FlutterError.dumpErrorToConsole(details);
    // Optionally, show a dialog or send to a crash reporting service
  };

  WidgetsFlutterBinding.ensureInitialized();

  // Create a list of dummy posts
  final dummyPosts = [DummyData.getDummyPost()];
  
  // Create an instance of the DAO
  final postsDao = PostsDao();
  
  // Populate the database with the dummy data
  await postsDao.populateWithDummyData(dummyPosts);
  
  // Retrieve the posts from the database
  final retrievedPosts = await postsDao.getPosts();
  
  runZonedGuarded(() {
    runApp(MainApp(posts: retrievedPosts));
  }, (error, stackTrace) {
    // Handle uncaught asynchronous errors here
    print('Caught Dart error: $error');
    // Optionally, send to a crash reporting service
  });

}

class MainApp extends StatelessWidget {

  final List<Post> posts;

  const MainApp({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SizedBox(
              width: 600, // max allowed width
              child: TwitterEmbedCard(posts: posts),
            ),
          ),
        ),
      ),
    );
  }
}

class TwitterEmbedCard extends StatelessWidget {

  final List<Post> posts;

  const TwitterEmbedCard({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Screen Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(posts: posts),
    );
  }
}
