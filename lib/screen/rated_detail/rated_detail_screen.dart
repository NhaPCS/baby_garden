import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/booking_detail_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/rated_detail/widget/rated_item.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class RatedDetailScreen extends StatefulWidget {
  final String bookingId;
  final bool isService;

  const RatedDetailScreen({this.bookingId = "1", this.isService = false})
      : super();

  @override
  State<StatefulWidget> createState() {
    return _RatedDetailScreenState();
  }
}

class _RatedDetailScreenState extends BaseState<RatedDetailScreen> {
  final BookingDetailProvider _bookingDetailProvider =
      new BookingDetailProvider();

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
        title: S.of(context).order_rating(""),
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      body: Consumer<BookingDetailProvider>(builder:
          (BuildContext context, BookingDetailProvider value, Widget child) {
        var bookingDetailData = value.bookingDetailData;
        if (bookingDetailData == null) {
          return Container();
        }
        return ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(
                    S.of(context).order_with_code(bookingDetailData['code']),
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: ColorUtil.textColor),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(
                    S.of(context).order_date(bookingDetailData['date_booking'] +
                        " " +
                        bookingDetailData['time_booking']),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(
                    bookingDetailData['active'] == "4"
                        ? S
                            .of(context)
                            .cancel_time_inset(bookingDetailData['time_cancel'])
                        : (widget.isService
                            ? S
                                .of(context)
                                .using_date(bookingDetailData["date_booking"],bookingDetailData["time_booking"])
                            : S.of(context).receiving_date(
                                bookingDetailData['time_finish'])),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            WidgetUtil.getLine(
              margin: EdgeInsets.only(
                  top: SizeUtil.smallSpace, bottom: SizeUtil.tinySpace),
            ),
            widget.isService
                ? RatedItem(
                    shopImg: bookingDetailData['shop_img'],
                    shopName: bookingDetailData['shop_name'],
                    itemTitle: bookingDetailData['service_name'],
                    isShowStar: true,
                    star: int.parse(
                      bookingDetailData['star'],
                    ),
                    rateContent: bookingDetailData['content'],
                    rateImg: bookingDetailData['img'],
                    rateTime: bookingDetailData["time_rate"],
                  )
                : (bookingDetailData['list_rating'] != null
                    ? Column(
                        children: List.generate(
                            bookingDetailData['list_rating'].length,
                            (index) {
                              var productData = bookingDetailData['list_rating']
                                      [index];
                              return RatedItem(
                                  shopImg: bookingDetailData['shop_img'],
                                  shopName: bookingDetailData['shop_name'],
                                  itemTitle: productData['product_name'],
                              isShowStar: true,
                              star: int.parse(
                                productData['star'],
                              ),
                                  rateContent: productData['content'],
                                  rateImg: productData['img'],
                                  rateTime: productData["date"]
                                );
                            }))
                    : SizedBox()),
          ],
        );
      }),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _bookingDetailProvider)];
  }
}
