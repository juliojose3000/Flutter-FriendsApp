import 'package:flutter/material.dart';
import 'package:twitter_embed_card/presentation/widgets/post_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main Screen'),
        ),
        body: const Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: PostWidget(),
                ),
              ],
            )
          ],
        ));
  }
}
