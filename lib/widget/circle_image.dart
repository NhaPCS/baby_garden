import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  final double size;
  final double borderRadius;

  const CircleImage({Key key, this.imageUrl, this.size, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              borderRadius == null ? size : borderRadius)),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(borderRadius == null ? size : borderRadius)),
          image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
