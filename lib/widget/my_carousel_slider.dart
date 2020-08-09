import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/product/image_count.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class MyCarouselSlider extends StatefulWidget {
  final List<dynamic> images;
  final double indicationSize;
  final double height;
  final double width;
  final double borderRadius;
  final EdgeInsets margin;
  final bool isAssetImage;
  final Color indicatorActiveColor;
  final Color indicatorInactiveColor;
  final Color slideBackground;
  final BoxFit boxFit;
  final bool hasShadow;
  final ValueChanged<int> onItemPressed;
  final ValueChanged<int> onItemSelected;
  final String imageAttrName;
  final bool isShowImageCount;
  final bool autoPlay;

  const MyCarouselSlider(
      {Key key,
      this.images,
      this.indicationSize = 7,
      this.height = double.infinity,
      this.borderRadius = SizeUtil.smallRadius,
      this.margin = SizeUtil.smallPadding,
      this.isAssetImage = false,
      this.indicatorActiveColor = ColorUtil.primaryColor,
      this.indicatorInactiveColor = Colors.white,
      this.slideBackground = ColorUtil.lightGray,
      this.boxFit = BoxFit.cover,
      this.width = double.infinity,
      this.hasShadow = false,
      this.onItemPressed,
      this.onItemSelected,
      this.imageAttrName,
      this.isShowImageCount = false,
      this.autoPlay = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyCarouselState();
  }
}

class _MyCarouselState extends State<MyCarouselSlider> {
  int selectedPosition = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          autoPlay: widget.autoPlay,
          autoPlayInterval: Duration(seconds: 3),
          height: widget.height,
          viewportFraction: 1.0,
          enableInfiniteScroll: widget.autoPlay,
          aspectRatio: 1,
          onPageChanged: (index) {
            if (widget.onItemSelected != null) widget.onItemSelected(index);
            setState(() {
              selectedPosition = index;
            });
          },
          items: widget.images.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  child: Container(
                    margin: widget.margin,
                    width: widget.width,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: widget.slideBackground,
                        boxShadow:
                            widget.hasShadow ? WidgetUtil.getShadow() : null,
                        image: getItem(image),
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.borderRadius))),
                  ),
                  onTap: () {
                    if (widget.onItemPressed != null)
                      widget.onItemPressed(widget.images.indexOf(image));
                  },
                );
              },
            );
          }).toList(),
        ),
        widget.isShowImageCount
            ? ImageCount(
                backgroundColor: Colors.white,
                borderColor: Colors.white,
                textColor: ColorUtil.textColor,
                text: "${selectedPosition + 1} / ${widget.images.length}",
              )
            : SizedBox(),
        Positioned(
            bottom: SizeUtil.smallSpace,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: widget.images == null || widget.images.length <= 0
                  ? null
                  : DotsIndicator(
                      dotsCount: widget.images.length,
                      position: selectedPosition.toDouble(),
                      decorator: DotsDecorator(
                        color: widget.indicatorInactiveColor,
                        activeColor: widget.indicatorActiveColor,
                        size: Size.square(widget.indicationSize),
                        activeSize: Size.square(widget.indicationSize),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(widget.indicationSize)),
                        activeShape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(widget.indicationSize)),
                      ),
                    ),
            ))
      ],
    );
  }

  DecorationImage getItem(dynamic image) {
    String imagePath =
        widget.imageAttrName == null ? image : image[widget.imageAttrName];
    return DecorationImage(
        image: widget.isAssetImage
            ? AssetImage(image)
            : CachedNetworkImageProvider(imagePath),
        fit: widget.boxFit);
  }
}
