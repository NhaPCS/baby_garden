import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  final double width;
  final double height;
  final EdgeInsets margin;

  const CircleImage(
      {Key key,
      this.imageUrl,
        this.margin = const EdgeInsets.all(4),
      this.borderRadius,
      @required this.width,
      @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              borderRadius == null ? width : borderRadius)),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(borderRadius == null ? width : borderRadius)),
          image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
