import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:flutter/material.dart';

class LoadMoreNestedScrollView extends StatefulWidget {
  final Widget body;
  final NestedScrollViewHeaderSliversBuilder headerSliverBuilder;
  final VoidCallback onLoadMore;
  final int pageSize;
  final bool hasRefresh;

  const LoadMoreNestedScrollView(
      {Key key,
      @required this.body,
      @required this.headerSliverBuilder,
      this.hasRefresh = true,
      @required this.onLoadMore,
      this.pageSize = service.PAGE_SIZE})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadMoreState();
  }
}

class _LoadMoreState extends State<LoadMoreNestedScrollView> {
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!isPerformingRequest) {
          widget.onLoadMore();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: _scrollController,
        body: widget.body,
        headerSliverBuilder: widget.headerSliverBuilder);
  }
}
