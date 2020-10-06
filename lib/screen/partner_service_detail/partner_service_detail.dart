import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/widget/service_date_picker.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nested/nested.dart';

class PartnerServiceDetailScreen extends StatefulWidget {
  final dynamic data;

  const PartnerServiceDetailScreen({this.data}) : super();

  @override
  State<StatefulWidget> createState() {
    return _PartnerServiceDetailScreenScreen();
  }
}

class _PartnerServiceDetailScreenScreen
    extends BaseState<PartnerServiceDetailScreen>
    with TickerProviderStateMixin {
  final ValueNotifier<String> _timeValueController = ValueNotifier('');
  final ValueNotifier<String> _dateValueController = ValueNotifier('');

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: S.of(context).service_detail),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.smallSpace,
                top: SizeUtil.tinySpace,
                bottom: SizeUtil.midSmallSpace),
            child: Text(
              widget.data['name'],
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtil.textSizeDefault),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: SizeUtil.smallSpace),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Giá niêm yết: ',
                    style: TextStyle(
                        color: ColorUtil.textColor,
                        fontSize: SizeUtil.textSizeSmall)),
                TextSpan(
                    text: StringUtil.getPriceText(widget.data['price']),
                    style: TextStyle(
                        color: Colors.red, fontSize: SizeUtil.textSizeSmall))
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.smallSpace, bottom: SizeUtil.tinySpace),
            child: Text('Thời gian thực hiện: ${widget.data['ex_time']}',
                style: TextStyle(
                    color: ColorUtil.textColor,
                    fontSize: SizeUtil.textSizeSmall,
                    height: 1.5)),
          ),
          WidgetUtil.getLine(
              width: 1, margin: EdgeInsets.all(0), color: ColorUtil.lineColor),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.smallSpace, top: SizeUtil.tinySpace),
            child: Text(
              'Thông tin dịch vụ:',
              style: TextStyle(
                  color: ColorUtil.red,
                  fontSize: SizeUtil.textSizeExpressTitle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.smallSpace,
                top: SizeUtil.midSmallSpace,
                right: SizeUtil.smallSpace),
            child: Html(
              data: widget.data['content'],
              defaultTextStyle: TextStyle(
                  fontSize: SizeUtil.textSizeSmall, color: ColorUtil.textColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: SizeUtil.smallSpace,
                bottom: SizeUtil.midSmallSpace,
                right: SizeUtil.smallSpace),
            child: Text(
              'Thời gian',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: SizeUtil.textSizeExpressDetail,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ServiceDatePicker(
            timeOpen: widget.data['time_open'],
            selectDateController: _dateValueController,
            selectTimeController: _timeValueController,
          ),
          Container(
              padding: const EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.smallSpace,
                  top: SizeUtil.tinySpace,
                  bottom: SizeUtil.tinySpace),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () async {
                  Navigator.pop(context, {
                    'date': _dateValueController.value,
                    'time': _timeValueController.value
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                  Radius.circular(SizeUtil.smallRadius),
                )),
                color: ColorUtil.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(SizeUtil.midSpace),
                  child: Text(
                    S.of(context).book,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}
