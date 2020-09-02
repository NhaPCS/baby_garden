import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedImage extends StatelessWidget {
  final String url;
  final BoxFit boxFit;
  final double width;
  final double height;

  const MyCachedImage(
      {Key key, this.url, this.boxFit = BoxFit.cover, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url == null ? "" : url,
      fit: boxFit,
      errorWidget: (context, url, err) {
        return Container(
          height: height,
          alignment: Alignment.center,
          color: ColorUtil.lightGray,
          child: Text(
            S.of(context).no_image,
            style: TextStyle(color: ColorUtil.gray),
          ),
        );
      },
      placeholder: (context, url) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(ColorUtil.primaryColor),
          ),
        );
      },
    );
  }
}
