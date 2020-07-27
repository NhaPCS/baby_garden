import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef ReloadCallback = void Function(int page);
typedef LoadMoreItemWidgetBuilder = Widget Function(
    BuildContext context, dynamic item, int index);

class LoadMoreGridView extends StatefulWidget {
  final LoadMoreItemWidgetBuilder itemBuilder;
  final ReloadCallback reloadCallback;
  final EdgeInsetsGeometry padding;
  final List<dynamic> data;
  final int totalPage;
  final totalElement;
  final bool hasRefresh;
  final pageSize;
  final int crossAxisCount;
  final double childAspectRatio;
  final Axis scrollDirection;
  final ValueNotifier<int> pageController;
  final ScrollPhysics physics;
  final bool dataIsFull;

  const LoadMoreGridView(
      {Key key,
      @required this.itemBuilder,
      @required this.reloadCallback,
      this.padding,
      this.totalPage = 0,
      this.crossAxisCount = 2,
      this.totalElement = 0,
      this.pageSize = service.PAGE_SIZE,
      this.hasRefresh = true,
      this.scrollDirection = Axis.vertical,
      this.childAspectRatio = 1.0,
      this.data,
      this.pageController,
      this.physics = const ScrollPhysics(),
      this.dataIsFull = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadMoreGridViewState();
  }
}

class _LoadMoreGridViewState extends State<LoadMoreGridView> {
  int page = 0;
  ScrollController _scrollController = new ScrollController();
  bool isPerformingRequest = false;
  List<dynamic> listData;
  int savedPage;

  @override
  void initState() {
    if (widget.pageController != null) {
      widget.pageController.addListener(() {
        if (widget.pageController.value != null)
          this.page = widget.pageController.value;
      });
    }
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

  void generateList() {
    if(widget.dataIsFull) {
      listData=widget.data;
      return;
    }
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
    if (widget.hasRefresh)
      return RefreshIndicator(
          child: getGridView(),
          onRefresh: () {
            page = 0;
            if (widget.reloadCallback != null) widget.reloadCallback(page);
            return Future.delayed(Duration(milliseconds: 1000));
          });
    else
      return getGridView();
  }

  Widget getGridView() {
    return GridView.builder(
      scrollDirection: widget.scrollDirection,
      controller: _scrollController,
      itemBuilder: (context, index) {
        return widget.itemBuilder(context, listData[index], index);
      },
      padding: widget.padding,
      shrinkWrap: true,
      physics: widget.physics,
      itemCount: listData == null ? 0 : listData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          childAspectRatio: widget.childAspectRatio),
    );
  }
}
