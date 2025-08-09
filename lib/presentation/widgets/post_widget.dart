import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_embed_card/presentation/widgets/svg_label.dart';
import 'package:vector_graphics/vector_graphics_compat.dart'; // Add this import

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostHeader(),
                SizedBox(height: 10),
                PostContent(),
                SizedBox(height: 20),
                PostTimeInfo(),
                SizedBox(height: 10),
                PostDivider(),
                SizedBox(height: 10),
                PostActionButtons(),
                SizedBox(height: 10),
                PostReadRepliesButton()
              ],
            ),
          ),
        ));
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/andrea-avatar.png'),
          radius: 30,
        ),
        SizedBox(width: 10),
        Column(
          children: [
            Text('Andre Bizzotto',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Row(children: [
              Text('@biz84', style: TextStyle(color: Colors.black54)),
              SizedBox(width: 5),
              Text('·', style: TextStyle(color: Colors.grey)),
              SizedBox(width: 5),
              Text("Follow",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ])
          ],
        )
      ],
    );
  }
}

class PostContent extends StatelessWidget {
  const PostContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            'Did you know? \n\nWhen you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change. \n\nBut there is a better way that lets you depend only on the properties you care about (and minimize unnecesaary rebuilds)'),
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(12), // radius of corners
          child: Image.asset(
            'assets/media-query-banner.jpg',
            fit: BoxFit.cover, // keep aspect ratio while filling
          ),
        )
      ],
    );
  }
}

class PostTimeInfo extends StatelessWidget {
  const PostTimeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("10:21 AM · Jun 15, 2024",
            style: TextStyle(color: Colors.black54)),
        SizedBox(width: 5),
        Icon(Icons.info_outline, size: 24, color: Colors.black54)
      ],
    );
  }
}

class PostDivider extends StatelessWidget {
  const PostDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.black12,
      thickness: 1,
      height: 1,
    );
  }
}

class PostActionButtons extends StatelessWidget {
  const PostActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 20,
      children: [
        SvgLabel(
            assetName: 'icon_heart_red.svg', text: '997', color: Colors.red),
        SvgLabel(assetName: 'icon_comment.svg', text: 'Reply', color: Colors.blue),
        SvgLabel(assetName: 'icon_link.svg', text: 'Copy link', color: Colors.black38),
      ],
    );
  }
}

class PostReadRepliesButton extends StatelessWidget {
  const PostReadRepliesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          // Your action here
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          side: const BorderSide(
            color: Colors.black45, // Outline color
            width: 1, // Outline thickness
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 24, vertical: 12), // Button padding
        ),
        child: const Text(
          'Read 12 replies',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
