import 'package:flutter/material.dart';
import 'package:twitter_embed_card/domain/models/comment.dart';
import 'package:twitter_embed_card/domain/models/post.dart';
import 'package:twitter_embed_card/presentation/widgets/svg_label.dart';
import 'package:intl/intl.dart'; // Add this import

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostHeader(
                  post: post,
                ),
                const SizedBox(height: 10),
                PostContent(
                  post: post,
                ),
                const SizedBox(height: 20),
                PostTimeInfo(
                  post: post,
                ),
                const SizedBox(height: 10),
                const PostDivider(),
                const SizedBox(height: 10),
                PostActionButtons(),
                const SizedBox(height: 10),
                PostReadRepliesButton(
                  comments: post.comments,
                )
              ],
            ),
          ),
        ));
  }
}

class PostHeader extends StatelessWidget {
  final Post post;

  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(post.userphoto),
          radius: 30,
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(post.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Row(children: [
              Text(post.username,
                  style: const TextStyle(color: Colors.black54)),
              const SizedBox(width: 5),
              const Text('·', style: TextStyle(color: Colors.grey)),
              const SizedBox(width: 5),
              const Text("Follow",
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
  final Post post;

  const PostContent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post.content),
        const SizedBox(height: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(12), // radius of corners
          child: Image.asset(
            post.contentImages[0],
            fit: BoxFit.cover, // keep aspect ratio while filling
          ),
        )
      ],
    );
  }
}

class PostTimeInfo extends StatelessWidget {
  final Post post;

  const PostTimeInfo({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('h:mm a · MMM d, yyyy').format(post.createdAt);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(formattedDate, // Display date only
            style: const TextStyle(color: Colors.black54)),
        const SizedBox(width: 5),
        const Icon(Icons.info_outline, size: 24, color: Colors.black54)
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
        SvgLabel(
            assetName: 'icon_comment.svg', text: 'Reply', color: Colors.blue),
        SvgLabel(
            assetName: 'icon_link.svg',
            text: 'Copy link',
            color: Colors.black38),
      ],
    );
  }
}

class PostReadRepliesButton extends StatefulWidget {
  final List<Comment> comments;

  const PostReadRepliesButton({super.key, required this.comments});

  @override
  _PostReadRepliesButtonState createState() => _PostReadRepliesButtonState();
}

class _PostReadRepliesButtonState extends State<PostReadRepliesButton> {
  final List<Comment> _comments;

  _PostReadRepliesButtonState() : _comments = [];

  @override
  void initState() {
    super.initState();
    _comments.addAll(widget.comments);
  }

  // A method to handle adding a new comment.
  void _addComment() {
    // Calling setState() is crucial. It tells Flutter that the state has
    // changed and that the UI needs to be rebuilt to reflect the new state.
    setState(() {
      _comments.add(Comment(
          text: 'New Comment!',
          id: 50,
          createdAt: DateTime.now(),
          authorName: 'Charlie Graham'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          _addComment();
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
        child: Text(
          'Read ${_comments.length} replies',
          style: const TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
