import 'package:flutter/material.dart';
import 'package:planetx/pages/new_post/new_post_page_provider.dart';
import 'package:planetx/pages/new_post/post_button/post_button.dart';
import 'package:planetx/pages/new_post/post_button/post_button_provider.dart';
import 'package:provider/provider.dart';

import 'new_post_form_field.dart';

class NewPost extends StatelessWidget {
  const NewPost({super.key});

  static const routeName = '/new-post';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Post"),
      ),
      body: Consumer<NewPostPageProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: provider.formKey,
              child: ListView(
                children: [
                  NewPostFormField(
                    hint: "Content goes here...",
                    initialValue: provider.formData[NewPostForm.content],
                    onChnaged: (value) =>
                        provider.onChangeField(NewPostForm.content, value),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: _getPostButton(),
    );
  }

  Widget _getPostButton() {
    return ChangeNotifierProvider(
      create: (context) => PostButtonProvider(
        onPressed: () async {
          final navigator = Navigator.of(context);

          await Provider.of<NewPostPageProvider>(context, listen: false)
              .onPressed();

          navigator.pop();
        },
      ),
      child: const PostButton(),
    );
  }
}
