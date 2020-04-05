import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/view_model/rate_booking_view_model.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class RatingDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RatingDetailScreenState();
  }
}

class _RatingDetailScreenState extends BaseStateModel<RatingDetailScreen,RateBookingViewModel> {
  final TextEditingController _noteController = new TextEditingController();
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget

    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).order_rating("vcb19.12.15"),
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).order_with_code("VCB19.12.25"),
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: ColorUtil.textColor),
                  ),
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).order_date("25/12/2019 12:25"),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: SizeUtil.tinySpace,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).receiving_date("25/12/2019 12:25"),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: List.generate(3, (index) => Column(children: <Widget>[
                WidgetUtil.getLine(width:SizeUtil.tinySpace,margin:  EdgeInsets.only(
                    top: SizeUtil.smallSpace, bottom: SizeUtil.tinySpace),color: ColorUtil.lineColor,),
                Padding(
                  padding: const EdgeInsets.only(
                      left: SizeUtil.smallSpace,
                      right: SizeUtil.smallSpace,
                      top: SizeUtil.tinySpace),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset("photo/order_img.png",
                          width: MediaQuery.of(context).size.width / 6),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: SizeUtil.smallSpace),
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  S.of(context).order_title,
                                  style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              SizedBox(
                                height: SizeUtil.tinySpace,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  S.of(context).supply_by_supplier("Vườn của bé"),
                                  style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: SizeUtil.tinySpace, bottom: SizeUtil.smallSpace),
                  child: RatingBar(
                    enable: true,
                    value: 0,
                    isIcon: true,
                    showRateCount: false,
                    iconColor: ColorUtil.primaryColor,
                    starSize: SizeUtil.iconSizeBig,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(SizeUtil.smallRadius)),
                    border: Border(
                      left: BorderSide(
                        color: ColorUtil.textColor,
                        width: 1,
                      ),
                      right: BorderSide(
                        color: ColorUtil.textColor,
                        width: 1,
                      ),
                      top: BorderSide(
                        color: ColorUtil.textColor,
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: ColorUtil.textColor,
                        width: 1,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.only(
                      left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _noteController,
                        style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                        decoration: InputDecoration(
                            hintText: S.of(context).rating_hint,
                            border: InputBorder.none),
                      ),
                      SizedBox(
                        height: SizeUtil.normalSpace,
                      )
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(left:
                      SizeUtil.smallSpace, right:  SizeUtil.smallSpace,top:  SizeUtil.tinySpace
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(SizeUtil.smallRadius),
                          )),
                      color: ColorUtil.blueForgotPass,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            //todo alignment center content
                            child: SizedBox(),
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: SizeUtil.smallSpace,
                          ),
                          Text(
                            S.of(context).add_image,
                            style: TextStyle(
                                fontSize: SizeUtil.textSizeSmall,
                                color: Colors.white,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    )),
              ],)),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(
                SizeUtil.smallSpace,
              ),
              width: MediaQuery.of(context).size.width,
              child:
              RaisedButton(
                onPressed: () {
                  getViewModel().onRateBooking(userID: Provider.of<UserProvider>(context,listen: false).userInfo['id'],bookingId: 1,star: 4,content: _noteController.text.trim());
                  Navigator.of(context).pop();
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeUtil.smallRadius),
                    )),
                color: ColorUtil.primaryColor,
                child: Text(
                  S.of(context).send_rating,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal),
                ),
              )),
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return null;
  }

  @override
  RateBookingViewModel initViewModel() {
    // TODO: implement initViewModel
    return new RateBookingViewModel(context);
  }
}
