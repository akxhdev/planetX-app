import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:planetx/models/post.dart';
import 'package:planetx/pages/home/screens/feed/feed_list_view_item/feed_image.dart';
import 'package:planetx/widgets/loading_spinner.dart';

class FeedListViewItem extends StatelessWidget {
  const FeedListViewItem({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post.imageUrl != null && (post.imageUrl!.startsWith("http")))
            FeedImage(imageUrl: post.imageUrl!),
          ListTile(
            title: Text(post.content),
            subtitle: Text(
              post.postedBy,
              style: GoogleFonts.robotoMono(
                textStyle: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              post.createdAt.difference(DateTime.now()).inHours < 24
                  ? DateFormat.MMMEd().format(post.createdAt)
                  : DateFormat("MMMM dd").format(post.createdAt),
              style: GoogleFonts.robotoMono(
                textStyle: Theme.of(context).textTheme.caption,
              ),
            ),
          )
        ],
      ),
    );
  }
}
