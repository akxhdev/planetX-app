import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:planetx/models/new_post_request.dart';

class NewPostPageProvider with ChangeNotifier {
  final String alienId;
  final Future<void> Function(NewPostRequest)? createPost;
  final Map<NewPostForm, dynamic> formData;
  final GlobalKey<FormState> formKey;
  final Future<String> Function(XFile)? uploadImage;

  bool _showProgressIndicator = false;

  NewPostPageProvider({
    required this.alienId,
    this.createPost,
    required this.formData,
    required this.formKey,
    this.uploadImage,
  });

  bool get showProgressIndicator => _showProgressIndicator;

  void onChangeField(NewPostForm field, dynamic value) {
    formData[field] = value;
    notifyListeners();
  }

  bool get _isFormValid => formKey.currentState?.validate() ?? false;

  Future<void> onPressed() async {
    if (!_isFormValid || createPost == null) return;

    final content = formData[NewPostForm.content];

    if (content == null) return;

    var newPostRequest = NewPostRequest(
      content: content,
      postedBy: alienId,
    );

    await createPost!(newPostRequest);
  }
}

enum NewPostForm { content, image }
