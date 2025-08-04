import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String thumb, id;
  const ImageCard({super.key, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return Hero(
      // 같은 이미지를 쓰므로 이미지는 그대로 두고 페이지가 전환되는 듯이 보여주는 애니메이션 위젯
      // looks sooooooooo cool widget!
      tag: id,
      child: Container(
        width: 250,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              offset: const Offset(10, 10),
              color: Colors.black.withValues(alpha: 0.3),
            ),
          ],
        ),
        child: Image.network(thumb),
      ),
    );
  }
}
