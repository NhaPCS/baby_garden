import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar, this._onFilterClick);

  final VoidCallback _onFilterClick;
  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: _tabBar),
            Padding(
              padding: SizeUtil.smallPadding,
              child: Icon(
                FontAwesomeIcons.filter,
                size: SizeUtil.iconSize,
              ),
            )
          ],
        ),
      ),
      onTap: _onFilterClick,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
