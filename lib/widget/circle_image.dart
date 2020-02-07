import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:baby_garden_flutter/util/resource.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  final double size;

  const CircleImage({Key key, this.imageUrl, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: CircleBorder(side: BorderSide(color: ColorUtil.textGray)),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(size)),
          image: DecorationImage(
              image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
