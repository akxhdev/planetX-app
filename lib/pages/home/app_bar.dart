import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "alien",
        style: GoogleFonts.robotoMono(
          textStyle: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
