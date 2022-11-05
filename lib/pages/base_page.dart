import 'package:flutter/material.dart';
import 'package:planetx/pages/home/home_page.dart';
import 'package:planetx/pages/home/home_page_provider.dart';

import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'auth/auth_page.dart';
import 'auth/auth_page_provider.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        var alien = provider.alien;

        if (alien != null) {
          return ChangeNotifierProvider(
            create: (context) => HomePageProvider(),
            child: const HomePage(),
          );
        }

        return ChangeNotifierProvider(
          create: (context) => AuthPageProvider(),
          child: const AuthPage(),
        );
      },
    );
  }
}
