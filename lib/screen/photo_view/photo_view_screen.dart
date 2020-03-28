import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewScreen extends StatefulWidget {
  final List<dynamic> images;
  final String imageAttrName;
  final int initIndex;

  const PhotoViewScreen(
      {Key key, @required this.images, this.imageAttrName, this.initIndex = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PhotoViewState();
  }
}

class _PhotoViewState extends BaseState<PhotoViewScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      _pageController.animateToPage(widget.initIndex,
          duration: Duration(milliseconds: 200), curve: Curves.linearToEaseOut);
    });
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PhotoViewGallery.builder(
          pageController: _pageController,
          scrollPhysics: const BouncingScrollPhysics(),
          builder: (BuildContext context, int index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: CachedNetworkImageProvider(
                  widget.imageAttrName == null
                      ? widget.images[index]
                      : widget.images[index][widget.imageAttrName]),
            );
          },
          itemCount: widget.images.length,
          loadingBuilder: (context, event) => Center(
            child: Container(
              width: 20.0,
              height: 20.0,
              child: CircularProgressIndicator(
                value: event == null
                    ? 0
                    : event.cumulativeBytesLoaded / event.expectedTotalBytes,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }
}
