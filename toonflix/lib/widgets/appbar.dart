import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String barTitle;
  const AppTopBar({super.key, this.barTitle = ''});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black,
      elevation: 2,
      centerTitle: true,
      foregroundColor: Colors.green,
      backgroundColor: Colors.white,
      title: Text(
        barTitle,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
