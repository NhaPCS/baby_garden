import 'package:flutter/material.dart';

class SliverCategoryDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;

  SliverCategoryDelegate(this.child, this.minHeight, this.maxHeight);

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
    return oldDelegate.maxExtent!=maxHeight;
  }
}
