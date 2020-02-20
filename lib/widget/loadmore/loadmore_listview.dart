import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

typedef ReloadCallback = void Function(int page);

class LoadMoreListView extends StatefulWidget {
  final int itemsCount;
  final IndexedWidgetBuilder itemBuilder;
  final ReloadCallback reloadCallback;
  final EdgeInsetsGeometry padding;
  final totalElement;
  final int totalPage;
  final pageSize;

  const LoadMoreListView(
      {Key key,
      this.itemsCount,
      this.itemBuilder,
      this.reloadCallback,
      this.padding,
      this.totalPage = 0,
      this.totalElement = 0,
      this.pageSize = service.PAGE_SIZE})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadMoreListViewState();
  }
}

class _LoadMoreListViewState extends State<LoadMoreListView> {
  int page = 0;
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
    return RefreshIndicator(
        child: ListView.builder(
          controller: _scrollController,
          itemBuilder: widget.itemBuilder,
          padding: widget.padding,
          itemCount: widget.itemsCount,
        ),
        onRefresh: () {
          page = 0;
          widget.reloadCallback(page);
          return Future.delayed(Duration(milliseconds: 1000));
        });
  }
}
