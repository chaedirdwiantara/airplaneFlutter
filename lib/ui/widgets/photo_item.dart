import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}
