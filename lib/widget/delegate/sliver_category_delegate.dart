import 'package:flutter/material.dart';

class SliverCategoryDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;
  final bool rebuild;

  SliverCategoryDelegate(this.child, this.minHeight, this.maxHeight,
      {this.rebuild = false});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => minHeight;

  @override
  double get minExtent => maxHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return rebuild || oldDelegate.maxExtent != maxHeight;
  }
}
