import 'package:flutter/material.dart';
import 'package:planetx/pages/home/app_bar.dart';
import 'package:planetx/pages/home/home_page_provider.dart';

import 'package:provider/provider.dart';

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
      floatingActionButton: const FloatingActionButton.small(
        onPressed: null,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
