import 'package:baby_garden_flutter/dialog/receive_barcode_dialogue.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/product_order_item.dart';
import 'package:baby_garden_flutter/provider/booking_detail_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/checkout/widget/rich_text_form.dart';
import 'package:baby_garden_flutter/screen/order_detail/widget/order_info.dart';
import 'package:baby_garden_flutter/screen/rating_detail/rating_detail_screen.dart';
import 'package:baby_garden_flutter/screen/service_detail/view_model/service_detail_view_model.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ServiceDetailScreen extends StatefulWidget {
  final String title;
  final String bookingId;

  const ServiceDetailScreen({this.title, this.bookingId = "0"}) : super();

  @override
  State<StatefulWidget> createState() {
    return _ServiceDetailScreenState();
  }
}

class _ServiceDetailScreenState
    extends BaseStateModel<ServiceDetailScreen, ServiceDetailViewModel> {
  final BookingDetailProvider _bookingDetailProvider = BookingDetailProvider();
  ServiceState state = ServiceState.NONE;

  @override
  void initState() {
    // TODO: implement initState
    _bookingDetailProvider.getBookingDetail(widget.bookingId);
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
        appBar: getAppBar(
          title: widget.title,
          centerTitle: true,
          bgColor: ColorUtil.primaryColor,
          titleColor: Colors.white,
          backColor: Colors.white,
        ),
        body: Consumer<BookingDetailProvider>(
          builder: (BuildContext context, BookingDetailProvider value,
              Widget child) {
            var bookingDetailData = value.bookingDetailData;
            if (bookingDetailData == null) return Container();
            initView(int.parse(bookingDetailData['active']));
            return ListView(children: <Widget>[
              WidgetUtil.getLine(
                  width: SizeUtil.smallSpace,
                  margin: EdgeInsets.all(0),
                  color: ColorUtil.lineService),
              Container(
                  color: ColorUtil.bgService,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(
                      left: SizeUtil.normalSpace,
                      right: SizeUtil.normalSpace,
                      top: SizeUtil.midSmallSpace,
                      bottom: SizeUtil.midSmallSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        S.of(context).service_header(
                            bookingDetailData['code'],
                            bookingDetailData['date']),
                        style: TextStyle(height: 1.5),
                      ),
                      RichTextForm(
                          title: S.of(context).supply_by,
                          titleStyle: TextStyle(
                              color: ColorUtil.textColor,
                              fontWeight: FontWeight.normal,
                              height: 1.5),
                          content: bookingDetailData['shop_name'],
                          contentStyle: TextStyle(
                              color: ColorUtil.primaryColor,
                              fontWeight: FontWeight.bold)),
                    ],
                  )),
              WidgetUtil.getLine(width: 1, margin: EdgeInsets.all(0)),
              OrderInfo(
                svgIcon: "ic_receive_location.svg",
                title: S.of(context).service_using_address,
                content: bookingDetailData['address'],
              ),
              //todo missing time using
              OrderInfo(
                svgIcon: 'ic_receive_method.svg',
                title: S.of(context).time_using,
                content: bookingDetailData['time_service'],
              ),
              //todo missing using date
              OrderInfo(
                svgIcon: 'ic_payment_method.svg',
                title: S.of(context).date_using,
                content: bookingDetailData['date_booking'] + " " + bookingDetailData['time_booking'],
              ),
              OrderInfo(
                svgIcon: 'order_info.svg',
                title: S.of(context).order_info,
                contentWidget: Padding(
                  padding: EdgeInsets.only(
                      left: SizeUtil.normalSpace, bottom: SizeUtil.tinySpace),
                  child: ProductOrderItem(
                    imageUrl: bookingDetailData['shop_img'],
                    title: bookingDetailData['service_name'],
                    subTitle: bookingDetailData['service_content'],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: SizeUtil.normalSpace,
                    right: SizeUtil.normalSpace,
                    bottom: SizeUtil.midSmallSpace),
                child: RichTextForm(
                    title: S.of(context).total_order_price,
                    titleStyle: TextStyle(
                        color: ColorUtil.textColor,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                    content: StringUtil.getPriceText(
                        bookingDetailData['total_money']),
                    contentStyle: TextStyle(
                        color: ColorUtil.red, fontWeight: FontWeight.bold)),
              ),
              state == ServiceState.CANCEL
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        WidgetUtil.getLine(
                            width: 1,
                            color: ColorUtil.lineColor,
                            margin: EdgeInsets.all(0)),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: SizeUtil.normalSpace,
                              right: SizeUtil.normalSpace,
                              top: SizeUtil.midSmallSpace,
                              bottom: SizeUtil.midSmallSpace),
                          child: Row(
                            children: <Widget>[
                              Text(S.of(context).cancel_by,
                                  style: TextStyle(
                                      fontSize:
                                          SizeUtil.textSizeExpressDetail)),
                              Spacer(),
                              Text(bookingDetailData['cancel_by'] == "1"
                                  ? S.of(context).cancel_by_owner
                                  : S.of(context).cancel_by_shop,
                                  style: TextStyle(
                                      fontSize: SizeUtil.textSizeExpressDetail,
                                      color: ColorUtil.primaryColor))
                            ],
                          ),
                        ),
                        WidgetUtil.getLine(
                            width: 1,
                            color: ColorUtil.lineColor,
                            margin: EdgeInsets.all(0)),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: SizeUtil.normalSpace,
                              right: SizeUtil.normalSpace,
                              top: SizeUtil.midSmallSpace,
                              bottom: SizeUtil.midSmallSpace),
                          child: Row(
                            children: <Widget>[
                              Text(S.of(context).cancel_time,
                                  style: TextStyle(
                                      fontSize:
                                          SizeUtil.textSizeExpressDetail)),
                              Spacer(),
                              Text(bookingDetailData['time_cancel'],
                                  style: TextStyle(
                                      fontSize: SizeUtil.textSizeExpressDetail))
                            ],
                          ),
                        ),
                        WidgetUtil.getLine(
                            width: 1,
                            color: ColorUtil.lineColor,
                            margin: EdgeInsets.all(0)),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: SizeUtil.normalSpace,
                              right: SizeUtil.normalSpace,
                              top: SizeUtil.midSmallSpace,
                              bottom: SizeUtil.midSmallSpace),
                          child: Row(
                            children: <Widget>[
                              Text(S.of(context).cancel_reason,
                                  style: TextStyle(
                                      fontSize:
                                          SizeUtil.textSizeExpressDetail)),
                              Spacer(),
                              Text(bookingDetailData['reason_cancel'],
                                  style: TextStyle(
                                      fontSize: SizeUtil.textSizeExpressDetail))
                            ],
                          ),
                        ),
                      ],
                    )
                  : Spacer(),
              state != ServiceState.CANCEL
                  ? Column(
                      children: <Widget>[

              bookingDetailData['is_rate'] == "0"?
                        MyRaisedButton(
                          matchParent: true,
                          color: ColorUtil.primaryColor,
                          borderRadius: SizeUtil.zeroSpace,
                          textStyle: TextStyle(
                              fontSize: SizeUtil.textSizeDefault,
                              color: Colors.white,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold),
                          padding: EdgeInsets.only(
                              top: SizeUtil.midSpace,
                              bottom: SizeUtil.midSpace),
                          onPressed: () async {
                            //TODO booking
                            if (state == ServiceState.BOOKED_SCHEDULE) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      ReceiveBarCodeDialogue());
                            } else {
                              await push(RatingDetailScreen(
                                bookingId: bookingDetailData['id'],
                                isService: true,
                              ));
                              _bookingDetailProvider.getBookingDetail(widget.bookingId);
                            }
                          },
                          text: state == ServiceState.BOOKED_SCHEDULE
                              ? S.of(context).use_service.toUpperCase()
                              : S.of(context).rating_service.toUpperCase(),
                        ):SizedBox(),
                        state == ServiceState.BOOKED_SCHEDULE
                            ? MyRaisedButton(
                                matchParent: true,
                                color: ColorUtil.primaryColor,
                                borderRadius: SizeUtil.zeroSpace,
                                textStyle: TextStyle(
                                    fontSize: SizeUtil.textSizeDefault,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                padding: EdgeInsets.only(
                                    top: SizeUtil.midSpace,
                                    bottom: SizeUtil.midSpace),
                                onPressed: () {
                                  WidgetUtil.showConfirmDialog(
                                    context,
                                    message: S.of(context).cancel_question,
                                    title: S.of(context).attention,
                                    positiveClicked: () async {
                                      await getViewModel().onCancelBooking(
                                          context,
                                          bookingId: widget.bookingId);
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                                text:
                                    S.of(context).cancel_schedule.toUpperCase(),
                              )
                            : SizedBox()
                      ],
                    )
                  : SizedBox()
            ]);
          },
        ));
  }

  void initView(int active) {
    state = ServiceState.values[active];
    switch (state) {
      case ServiceState.BOOKED_SCHEDULE:
        break;
      case ServiceState.USED_SERVICE:
        break;
      default:
        break;
    }
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _bookingDetailProvider)];
  }

  @override
  ServiceDetailViewModel initViewModel() {
    // TODO: implement initViewModel
    return new ServiceDetailViewModel(context);
  }
}
