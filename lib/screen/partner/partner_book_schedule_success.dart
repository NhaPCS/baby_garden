import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
// TODO-Hung: screen mới thì move ra folder mới, không để chung
class PartnerBookScheduleSuccessScreen extends StatefulWidget{
  final dynamic data;
  final int dateIndex;
  final int timeIndex;

  const PartnerBookScheduleSuccessScreen(this.data, this.dateIndex, this.timeIndex):super();

  @override
  State<StatefulWidget> createState() {
    return _PartnerBookScheduleSuccessScreen();
  }

}

class _PartnerBookScheduleSuccessScreen extends BaseState<PartnerBookScheduleSuccessScreen>{
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
          // TODO-Hung: cái calendar này m dùng nhiều màn mà? move ra widget riêng đi
          Row(
            mainAxisSize: MainAxisSize.max,
            children: StringUtil.week
              .map((e) => Expanded(
                child: Container(
                padding: EdgeInsets.all(3),
                  color: StringUtil.week.indexOf(e)==widget.dateIndex?ColorUtil.primaryColor:Color(0xffF2F2F2),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        e['dow'],
                        style: TextStyle(
                          color: StringUtil.week.indexOf(e)==widget.dateIndex?Colors.white:Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeUtil.textSizeNotiTime),
                      ),
                      Text(
                        e['date'],
                        style: TextStyle(
                            color: StringUtil.week.indexOf(e)==widget.dateIndex?Colors.white:Colors.blue,
                            fontWeight: FontWeight.normal, fontSize: 6),
                      )
                    ],
                  ),
                ),
              ),
          )
              .toList(),),
          Container(
            height: MediaQuery.of(context).size.width / 3.50,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, childAspectRatio: 0.5),
              padding: EdgeInsets.all(0),
              itemCount: StringUtil.time.length,
              itemBuilder: (context, index) {

                return Container(
                  margin: EdgeInsets.all(1),
                  color: index==widget.timeIndex?Colors.red:Color(0xffF2F2F2),
                  child: Center(
                    child: Text(
                      StringUtil.time[index]['time'],
                      style: TextStyle(
                        color: index==widget.timeIndex?Colors.white:ColorUtil.textColor,
                          fontSize: SizeUtil.textSizeTiny),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          )
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

