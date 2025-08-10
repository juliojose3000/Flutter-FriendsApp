import 'package:flutter/material.dart';
import 'package:twitter_embed_card/data/dummy/dummy_data.dart';
import 'package:twitter_embed_card/data/local/posts_dao.dart';
import 'package:twitter_embed_card/domain/models/post.dart';
import 'package:twitter_embed_card/presentation/widgets/post_widget.dart';

class MainScreen extends StatelessWidget {

  final List<Post> posts;

  const MainScreen({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Screen'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: PostWidget(post: posts[0]),
                ),
              ],
            )
          ],
        ));
  }
}
