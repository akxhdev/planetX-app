import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'pages/base_page.dart';
import 'pages/new_post/new_post.dart';
import 'pages/new_post/new_post_page_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/post_provider.dart';
import 'services/authentication/auth_service_impl.dart';
import 'services/post/post_service_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(authService: AuthServiceImpl.instance),
        ),
        ChangeNotifierProxyProvider<AuthProvider, PostProvider>(
          create: (context) => PostProvider(
            token: Provider.of<AuthProvider>(context, listen: false).token,
            postService: PostServiceImpl.instance,
          ),
          update: (_, authProvider, previous) {
            return PostProvider(
              postService: previous?.postService ?? PostServiceImpl.instance,
              token: previous?.token ?? authProvider.token,
              posts: previous?.posts ?? [],
            );
          },
        )
      ],
      child: DynamicColorBuilder(
        builder: (lightColorScheme, darkColorScheme) => MaterialApp(
          title: "Planet-X",
          themeMode: ThemeMode.dark,
          theme: ThemeData(colorScheme: lightColorScheme),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            scaffoldBackgroundColor: Colors.black,
            textTheme: GoogleFonts.nunitoTextTheme(ThemeData.dark().textTheme),
            useMaterial3: true,
          ),
          home: const BasePage(),
          routes: {
            NewPost.routeName: (context) {
              return ChangeNotifierProxyProvider2<AuthProvider, PostProvider,
                  NewPostPageProvider>(
                create: (context) => NewPostPageProvider(
                  alienId:
                      Provider.of<AuthProvider>(context, listen: false).alienId,
                  formData: {NewPostForm.content: ""},
                  formKey: GlobalKey<FormState>(),
                ),
                update: (_, authProvider, postProvider, previous) {
                  return NewPostPageProvider(
                    alienId: authProvider.alienId,
                    createPost: postProvider.createPost,
                    formData: previous?.formData ?? {NewPostForm.content: ""},
                    formKey: previous?.formKey ?? GlobalKey<FormState>(),
                  );
                },
                child: const NewPost(),
              );
            },
          },
        ),
      ),
    );
  }
}
