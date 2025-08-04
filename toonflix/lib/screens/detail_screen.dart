import 'package:flutter/material.dart';
import 'package:toonflix/widgets/appbar.dart';
import 'package:toonflix/widgets/image_card.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(barTitle: title),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ImageCard(thumb: thumb)],
          ),
        ],
      ),
    );
  }
}
