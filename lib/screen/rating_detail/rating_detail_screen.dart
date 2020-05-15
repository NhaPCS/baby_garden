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
  final BookingDetailProvider _bookingDetailProvider =
      new BookingDetailProvider();
  final ValueNotifier<File> uploadImageController =
      new ValueNotifier(new File(""));

  BookingType _bookingType = BookingType.NONE;

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
        title: S.of(context).order_rating("vcb19.12.15"),
        centerTitle: true,
        bgColor: ColorUtil.primaryColor,
        titleColor: Colors.white,
        backColor: Colors.white,
      ),
      body: Consumer<BookingDetailProvider>(builder:
          (BuildContext context, BookingDetailProvider value, Widget child) {
        _bookingType =
            BookingType.values[int.parse(value.bookingDetailData['type'])];
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
                    S.of(context).order_with_code("VCB19.12.25"),
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: ColorUtil.textColor),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(
                    S.of(context).order_date("25/12/2019 12:25"),
                    style: TextStyle(fontSize: SizeUtil.textSizeTiny),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Text(
                    S.of(context).receiving_date("25/12/2019 12:25"),
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
              child: _bookingType == BookingType.BOOKINGSERVICE
                  ? RatingItem(
                      uploadImageController: uploadImageController,
                    )
                  : ListView(
                      //todo- hung: add lis image controller
                      children: List.generate(3, (index) => RatingItem()),
                    ),
            ),
            MyRaisedButton(
              padding: EdgeInsets.only(
                  top: SizeUtil.midSpace, bottom: SizeUtil.midSpace),
              onPressed: () {
                if (_bookingType == BookingType.BOOKINGSERVICE) {
                  getViewModel().onRateBooking(
                      bookingId: 1,
                      star: 4,
                      content: _noteController.text.trim(),
                      img: uploadImageController.value);
                } else {}
                Navigator.of(context).pop();
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
