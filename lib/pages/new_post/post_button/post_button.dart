import 'package:flutter/material.dart';
import 'package:planetx/pages/new_post/post_button/post_button_provider.dart';
import 'package:provider/provider.dart';

class PostButton extends StatelessWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostButtonProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const FloatingActionButton.small(
            onPressed: null,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        return FloatingActionButton.extended(
          onPressed: () => provider.onPressed(),
          icon: const Icon(Icons.send),
          label: const Text("Post"),
        );
      },
    );
  }
}
