import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/get_list_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class SetDateScreen extends StatefulWidget {
  @override
  _SetDateScreenState createState() => _SetDateScreenState();
}

class _SetDateScreenState extends BaseState<SetDateScreen>
    with TickerProviderStateMixin {
  final GetListProvider _getListProvider = GetListProvider();

  @override
  Widget buildWidget(BuildContext context) {
    String buttonTitle = S.of(context).confirm;
    return Scaffold(
        appBar: getAppBar(title: S.of(context).selectRemindTime),
        body: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 8),
                width: double.infinity,
                decoration: setBorder('top', Color(0xffE1D9D9), 1),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
                  child: Text(
                    'Chọn ngày nhắc',
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )),
            Container(
                decoration: setBorder('top', Color(0xffE4E4E4), 6),
                padding: EdgeInsets.only(top: 20),
                height: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // calender table
                  children: <Widget>[],
                )),
            Expanded(
                child: Container(
              decoration: setBorder('top', Color(0xffE4E4E4), 6),
            )),
            // button
            GestureDetector(
              child: Container(
                margin: SizeUtil.normalPadding,
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: ColorUtil.primaryColor,
                    borderRadius: BorderRadius.circular(SizeUtil.tinyRadius)),
                child: Center(
                  child: Text(
                    buttonTitle,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeBigger,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _getListProvider)];
  }
}
