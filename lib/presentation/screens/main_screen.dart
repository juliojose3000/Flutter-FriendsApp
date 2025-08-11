import 'package:flutter/material.dart';
import 'package:twitter_embed_card/data/local/posts_dao.dart';
import 'package:twitter_embed_card/domain/models/post.dart';
import 'package:twitter_embed_card/presentation/widgets/my_loader.dart';
import 'package:twitter_embed_card/presentation/widgets/post_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Screen'),
        ),
        body: Center(
          child: Expanded(
            child: FutureBuilder<List<Post>>(
              future: PostsDao().getPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const MyLoader();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return PostWidget(post: snapshot.data![0]);
                } else {
                  return const Text('No posts found.');
                }
              },
            ),
          ),
        ));
  }
}
