import 'package:flutter/material.dart';
import 'package:planetx/pages/home/app_bar.dart';
import 'package:planetx/pages/home/home_page_provider.dart';

import 'package:provider/provider.dart';

import '../new_post/new_post.dart';
import 'bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppBar(),
      body: Consumer<HomePageProvider>(
        builder: (context, provider, child) {
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.of(context).pushNamed(NewPost.routeName);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
