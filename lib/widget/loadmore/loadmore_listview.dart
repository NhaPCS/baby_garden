import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/material.dart';

import 'loadmore_gridview.dart';

typedef ReloadCallback = void Function(int page);

class LoadMoreListView extends StatefulWidget {
  final LoadMoreItemWidgetBuilder itemBuilder;
  final ReloadCallback reloadCallback;
  final EdgeInsetsGeometry padding;
  final totalElement;
  final int totalPage;
  final pageSize;
  final List<dynamic> data;
  final ValueNotifier<int> pageController;

  const LoadMoreListView(
      {Key key,
      @required this.itemBuilder,
      @required this.reloadCallback,
      this.padding,
      this.totalPage = 0,
      this.totalElement = 0,
      this.pageSize = service.PAGE_SIZE,
      @required this.data, this.pageController})
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
  List<dynamic> listData;

  void generateList() {
    print("page $page ");
    if (page == 0) {
      listData = widget.data;
    } else {
      if (listData == null) {
        listData = new List();
      }
      listData.addAll(widget.data);
    }
  }

  @override
  void initState() {
    if (widget.pageController != null) {
      widget.pageController.addListener(() {
        if (widget.pageController.value != null)
          this.page = widget.pageController.value;
      });
    }
    super.initState();
    print("TOTAL PAGE ${widget.totalElement}  ${page}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (!isPerformingRequest &&
            (widget.totalPage <= 0 || page < widget.totalPage) &&
            (widget.totalElement <= 0 ||
                (page + 1) * widget.pageSize < widget.totalElement)) {
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
    generateList();
    if (listData == null || listData.isEmpty) {
      return LoadingView(
        isNoData: listData != null,
        onReload: () {
          page = 0;
          if (widget.reloadCallback != null) widget.reloadCallback(page);
        },
      );
    }
    return RefreshIndicator(
        child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: _scrollController,
          itemBuilder: (context, index) {
            return widget.itemBuilder(context, listData[index], index);
          },
          padding: widget.padding,
          itemCount: listData == null ? 0 : listData.length,
        ),
        onRefresh: () {
          page = 0;
          widget.reloadCallback(page);
          return Future.delayed(Duration(milliseconds: 1000));
        });
  }
}
