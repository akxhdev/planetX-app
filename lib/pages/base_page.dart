import 'package:flutter/material.dart';
import 'package:planetx/pages/home/home_page.dart';
import 'package:planetx/pages/home/home_page_provider.dart';

import 'package:provider/provider.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: const HomePage(),
    );
  }
}
