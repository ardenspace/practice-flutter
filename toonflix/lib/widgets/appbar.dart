import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isShowHeart;
  final String barTitle;
  final bool isLiked;
  final VoidCallback onHeartTap;

  const AppTopBar({
    super.key,
    this.isShowHeart = true, // 기본적으로는 보이게
    this.barTitle = '',
    this.isLiked = false,
    required this.onHeartTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black,
      elevation: 2,
      centerTitle: true,
      foregroundColor: Colors.green,
      backgroundColor: Colors.white,
      actions: isShowHeart
          ? [
              IconButton(
                onPressed: onHeartTap,
                icon: Icon(
                  isLiked
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                ),
              ),
            ]
          : [],
      title: Text(
        barTitle,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
