import 'package:baby_garden_flutter/data/model/point.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/point_management/item/point_history_card_item.dart';
import 'package:baby_garden_flutter/screen/point_management/provider/point_manage_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PointHistoryScreen extends StatefulWidget {
  final Point pointInfo;

  PointHistoryScreen({Key key, this.pointInfo}) : super(key: key);

  @override
  _PointHistoryScreenState createState() => _PointHistoryScreenState();
}

class _PointHistoryScreenState extends BaseState<PointHistoryScreen> {
  final PointManageProvider _pointManageProvider = PointManageProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_pointManageProvider.pointList == null ||
        _pointManageProvider.pointList.isEmpty) {
      _pointManageProvider.getPointDetailList(context, widget.pointInfo.shopId);
    }
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).pointManage),
        body: Consumer<PointManageProvider>(builder: (context, value, child) {
          if (value.pointDetailList == null || value.pointDetailList.isEmpty)
            return LoadingView(isNoData: value.pointDetailList != null);
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                WidgetUtil.getLine(
                    margin: EdgeInsets.all(0),
                    width: 5,
                    color: ColorUtil.lineLightGray),
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeUtil.midSmallSpace, top: SizeUtil.smallSpace),
                  child: Text(
                    S.of(context).pointHistoryHeadText,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtil.textSizeBigger,
                        color: Color.fromRGBO(46, 95, 109, 1)),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.pointList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      final pointDetail =
                          _pointManageProvider.getPointDetail(index);
                      return PointHistoryCardItem(pointDetail: pointDetail);
                    }),
              ]);
        }));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _pointManageProvider)];
  }
}
