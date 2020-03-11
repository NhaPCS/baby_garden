import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef ReloadCallback = void Function(int page);

class LoadMoreGridView extends StatefulWidget {
  final int itemsCount;
  final IndexedWidgetBuilder itemBuilder;
  final ReloadCallback reloadCallback;
  final EdgeInsetsGeometry padding;
  final int totalPage;
  final totalElement;
  final bool hasRefresh;
  final pageSize;
  final int crossAxisCount;
  final double childAspectRatio;
  final Axis scrollDirection;

  const LoadMoreGridView(
      {Key key,
      this.itemsCount,
      this.itemBuilder,
      this.reloadCallback,
      this.padding,
      this.totalPage = 0,
      this.crossAxisCount = 2,
      this.totalElement = 0,
      this.pageSize = service.PAGE_SIZE,
      this.hasRefresh = true,
        this.scrollDirection = Axis.vertical,
      this.childAspectRatio = 1.0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadMoreGridViewState();
  }
}

class _LoadMoreGridViewState extends State<LoadMoreGridView> {
  int page = 1;
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

  @override
  void initState() {
    super.initState();
    print("TOTAL PAGE ${widget.totalPage}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!isPerformingRequest &&
            (widget.totalPage <= 0 || page < widget.totalPage) &&
            (widget.totalElement <= 0 ||
                page * widget.pageSize < widget.totalElement)) {
          print("TOTAL ${widget.totalPage}  $page");
          isPerformingRequest = true;
          page++;
          widget.reloadCallback(page);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    isPerformingRequest = false;
    if (widget.hasRefresh)
      return RefreshIndicator(
          child: GridView.builder(
            scrollDirection: widget.scrollDirection,
            controller: _scrollController,
            itemBuilder: widget.itemBuilder,
            padding: widget.padding,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: widget.itemsCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount,
                childAspectRatio: widget.childAspectRatio),
          ),
          onRefresh: () {
            page = 1;
            if (widget.reloadCallback != null) widget.reloadCallback(page);
            return Future.delayed(Duration(milliseconds: 1000));
          });
    else
      return GridView.builder(
        scrollDirection: widget.scrollDirection,
        controller: _scrollController,
        itemBuilder: widget.itemBuilder,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        padding: widget.padding,
        itemCount: widget.itemsCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount),
      );
  }
}
