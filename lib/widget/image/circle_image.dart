import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  final File imageFile;
  final double borderRadius;
  final double width;
  final double height;
  final EdgeInsets margin;
  final double elevation;

  const CircleImage(
      {Key key,
      this.imageUrl,
      this.margin = const EdgeInsets.all(4),
      this.borderRadius,
      @required this.width,
      @required this.height,
      this.imageFile,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      elevation: elevation,
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
              image: imageUrl != null
                  ? CachedNetworkImageProvider(imageUrl)
                  : imageFile != null
                      ? FileImage(imageFile)
                      : AssetImage("photo/child_avatar.png"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
