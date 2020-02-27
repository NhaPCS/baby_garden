import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/point_management/point_history_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class PointHistory extends StatefulWidget {
  final image;
  final name;
  final point;

  PointHistory({Key key, this.image, this.name, this.point}) : super(key: key);

  @override
  _PointHistoryState createState() => _PointHistoryState();
}

class _PointHistoryState extends BaseState<PointHistory> {
  final GetListProvider _getListProvider = GetListProvider();

  final pointCard = PointHistoryCard(
    image: "photo/voucherVCB.png",
    history: "Mua đơn hàng #AHQ123 thành...",
    dateTime: "18/12/2019 - 14:46",
    changedPoint: 200,
    remainPoint: 200,
  );

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(title: S.of(context).pointManage),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 5,
                color: Color.fromRGBO(228, 228, 228, 1),
              ),
              Container(
                padding: EdgeInsets.only(left: 8, top: 10),
                child: Text(
                  S.of(context).pointHistoryHeadText,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromRGBO(46, 95, 109, 1)),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[pointCard, pointCard, pointCard],
                ),
              ),
            ]));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
