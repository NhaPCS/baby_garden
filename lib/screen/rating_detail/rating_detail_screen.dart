import 'dart:io';

import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/booking_detail_provider.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/rating_detail/item/rating_item.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/screen/rating_detail/view_model/rate_booking_view_model.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class RatingDetailScreen extends StatefulWidget {
  final String bookingId;

  const RatingDetailScreen({this.bookingId = "1"}) : super();

  @override
  State<StatefulWidget> createState() {
    return _RatingDetailScreenState();
  }
}

class _RatingDetailScreenState
    extends BaseStateModel<RatingDetailScreen, RateBookingViewModel> {
  final TextEditingController _noteController = new TextEditingController();
  final List<TextEditingController> _noteProductController = new List();
  final BookingDetailProvider _bookingDetailProvider =
      new BookingDetailProvider();
  final ValueNotifier<File> uploadImageController =
      new ValueNotifier(new File(""));
  final List<ValueNotifier<File>> uploadImageProductController = new List();
  final List<ValueNotifier<int>> rates = new List();
  BookingType _bookingType = BookingType.NONE;
  ValueNotifier<int> rate = new ValueNotifier<int>(0);
  int productCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    _bookingDetailProvider.getBookingDetail(widget.bookingId);
    super.initState();
  }

  void initImageController(val) {
    for (int i = 0; i <= val; i++) {
      uploadImageProductController.add(new ValueNotifier(new File("")));
      _noteProductController.add(new TextEditingController());
      rates.add(new ValueNotifier<int>(0));
    }
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
        productCount = bookingDetailData["list_product"].length;
        getViewModel().setRateProductNumber(productCount);
        initImageController(productCount);
        _bookingType = BookingType.values[int.parse(bookingDetailData['type'])];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    S.of(context).order_with_code(bookingDetailData["code"]),
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: ColorUtil.textColor),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(
                    S.of(context).order_date(bookingDetailData["date_booking"]),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(
                    bookingDetailData["active"] == "4"
                        ? (S.of(context).cancel_time +
                            " " +
                            bookingDetailData["time_cancel"])
                        : S
                            .of(context)
                            .receiving_date(bookingDetailData["date_booking"]),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: SizeUtil.midSmallSpace,
                  ),
                ],
              ),
            ),
            Expanded(
              child: _bookingType == BookingType.BOOKING_SERVICE
                  ? RatingItem(
                      rate: rate,
                      controller: _noteController,
                      uploadImageController: uploadImageController,
                    )
                  : ListView(
                      children: List.generate(
                          productCount,
                          (index) => RatingItem(
                              rate: rates[index],
                              controller: _noteProductController[index],
                              title: bookingDetailData["list_product"][index]
                                  ["name"],
                              shopName: bookingDetailData["shop_name"],
                              uploadImageController:
                                  uploadImageProductController[index])),
                    ),
            ),
            MyRaisedButton(
              padding: EdgeInsets.only(
                  top: SizeUtil.midSpace, bottom: SizeUtil.midSpace),
              onPressed: () async {
                if (_bookingType == BookingType.BOOKING_SERVICE) {
                  await getViewModel().onRateBooking(
                      bookingId: widget.bookingId,
                      star: rate.value.toString(),
                      content: _noteController.text.trim(),
                      img: uploadImageController.value);
                } else {
                  for (int i = 0; i < productCount; i++) {
                    String id = bookingDetailData["list_product"][i]['id'];
                    getViewModel().onRateProduct(
                        productId: id,
                        bookingId: widget.bookingId,
                        star: rates[i].value.toString(),
                        content: _noteProductController[i].text.trim(),
                        img: uploadImageProductController[i].value);
                  }
                }
              },
              matchParent: true,
              color: ColorUtil.primaryColor,
              text: S.of(context).send_rating,
              textStyle: TextStyle(
                  fontSize: SizeUtil.textSizeSmall,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal),
            )
          ],
        );
      }),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _bookingDetailProvider)];
  }

  @override
  RateBookingViewModel initViewModel() {
    return new RateBookingViewModel(context);
  }
}
