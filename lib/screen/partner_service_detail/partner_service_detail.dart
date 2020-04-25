import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/partner/date_picker.dart';
import 'package:baby_garden_flutter/widget/partner/time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
// TODO-Hung: screen mới thì move ra folder mới, không để chung
class PartnerServiceDetailScreen extends StatefulWidget{
  final dynamic data;

  const PartnerServiceDetailScreen({this.data}):super();

  @override
  State<StatefulWidget> createState() {
    return _PartnerServiceDetailScreenScreen();
  }

}

class _PartnerServiceDetailScreenScreen extends BaseState<PartnerServiceDetailScreen> with TickerProviderStateMixin{
  int dateIndex = 0;
  int timeScheduleIndex = 0;
  String dateValue = "";
  final ValueNotifier<int> _timeValueController = ValueNotifier(0);
  final ValueNotifier<int> _dateValueController = ValueNotifier(0);

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: S.of(context).service_detail),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left:SizeUtil.smallSpace,top: SizeUtil.tinySpace,bottom: SizeUtil.midSmallSpace),
            child: Text(widget.data['name'],style: TextStyle(color: ColorUtil.primaryColor,fontWeight: FontWeight.bold,fontSize: SizeUtil.textSizeDefault),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:SizeUtil.smallSpace),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'Giá niêm yết: ',
                    style: TextStyle(color: ColorUtil.textColor,fontSize: SizeUtil.textSizeSmall)
                ),
                TextSpan(
                  text: StringUtil.getPriceText(widget.data['price']),
                  style: TextStyle(color: Colors.red,fontSize: SizeUtil.textSizeSmall)
                )
              ]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:SizeUtil.smallSpace,bottom: SizeUtil.tinySpace),
            child: Text('Thời gian thực hiện: ${widget.data['ex_time']}',style: TextStyle(color: ColorUtil.textColor,fontSize: SizeUtil.textSizeSmall,height: 1.5)),
          ),
          WidgetUtil.getLine(width: 1,margin: EdgeInsets.all(0),color: ColorUtil.lineColor),
          Padding(
            padding: const EdgeInsets.only(left:SizeUtil.smallSpace,top: SizeUtil.tinySpace),
            child: Text('Thông tin dịch vụ:',style: TextStyle(color: ColorUtil.red,fontSize: SizeUtil.textSizeExpressTitle),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:SizeUtil.smallSpace,top: SizeUtil.midSmallSpace,right: SizeUtil.smallSpace),
            child: Text(widget.data['content']
            ,style: TextStyle(fontSize: SizeUtil.textSizeSmall,color: ColorUtil.textColor),),
          ),
          Padding(
            padding: const EdgeInsets.only(left:SizeUtil.smallSpace,top: SizeUtil.midSmallSpace,right: SizeUtil.smallSpace,bottom: SizeUtil.midSmallSpace),
            child: Image.asset('photo/service_detail.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left:SizeUtil.smallSpace,bottom: SizeUtil.midSmallSpace,right: SizeUtil.smallSpace),
            child: Text('99.99% khách hàng đến trải nghiệm dịch vụ tại Thẩm mỹ viện Quốc tế Nevada và hài lòng tuyệt đối. Để tái sinh làn da và sở hữu một làn da căng bóng khỏe, tươi trẻ, đơn giản thôi, bạn hãy đến ngay với Thẩm mỹ viện Quốc tế Nevada để được tư vấn cụ thể.'
              ,style: TextStyle(fontSize: SizeUtil.textSizeSmall,color: ColorUtil.textColor),),
          ),
          //TODO time schedule
          Padding(
            padding: const EdgeInsets.only(left:SizeUtil.smallSpace,bottom: SizeUtil.midSmallSpace,right: SizeUtil.smallSpace),
            child: Text('Thời gian',style: TextStyle(color: Colors.black, fontSize: SizeUtil.textSizeExpressDetail,fontWeight: FontWeight.bold),),
          ),
          DatePicker(onValueChange:(val){
            dateValue = val['date'];
          },unSelectedColor: ColorUtil.blue,valueController: _dateValueController,),
          TimePicker(valueController: _timeValueController,),
          Container(
              padding: const EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.smallSpace,
                  top: SizeUtil.tinySpace,
                  bottom: SizeUtil.tinySpace),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton (
                onPressed: () async{
                  Navigator.pop(context,{'dateValue':dateValue,'date':_dateValueController.value,'time':_timeValueController.value});
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
    return [
    ];
  }

}

