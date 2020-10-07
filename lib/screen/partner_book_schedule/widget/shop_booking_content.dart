import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/service_detail_item.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/widget/service_date_picker.dart';
import 'package:baby_garden_flutter/screen/partner_service_detail/partner_service_detail.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:flutter/material.dart';

class ShopBookingContent extends StatelessWidget {
  final dynamic shop;
  final ValueNotifier<dynamic> selectedShopAddressController;
  final ValueNotifier<dynamic> selectedShopServiceController;
  final ValueNotifier<String> selectedDateController;
  final ValueNotifier<String> selectedTimeController;
  final VoidCallback onBookingService;

  const ShopBookingContent(
      {Key key,
      @required this.shop,
      @required this.selectedShopAddressController,
      @required this.selectedShopServiceController,
      @required this.selectedDateController,
      @required this.selectedTimeController, this.onBookingService})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(SizeUtil.midSmallSpace),
              child: Text(
                S.of(context).choose_client,
                style: TextStyle(
                    color: ColorUtil.textColor,
                    fontSize: SizeUtil.textSizeDefault,
                    fontWeight: FontWeight.bold),
              ),
            ),
            WidgetUtil.getLine(margin: EdgeInsets.all(0), width: 2),
            ValueListenableBuilder<dynamic>(
              valueListenable: selectedShopAddressController,
              builder: (BuildContext context, dynamic value, Widget child) {
                return Column(
                    children: getPlaces()
                        .map((e) => CustomRadioButton(
                              titleContent: Text(e['address']),
                              padding: const EdgeInsets.only(
                                  left: SizeUtil.smallSpace,
                                  top: SizeUtil.smallSpace),
                              value: e['id'],
                              groupValue: selectedShopAddressController.value['id'],
                              iconSize: SizeUtil.iconSize,
                              titleSize: SizeUtil.textSizeSmall,
                              onChanged: (val) {
                                selectedShopAddressController.value = e;
                              },
                            ))
                        .toList());
              },
            ),
            Center(
              child: WidgetUtil.getLine(
                  margin: EdgeInsets.only(top: SizeUtil.smallSpace), width: 2),
            ),
            //todo choose service title
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).choose_service(
                    shop['service'] != null ? shop['service'].length : 0),
                style: TextStyle(
                    color: ColorUtil.textColor,
                    fontSize: SizeUtil.textSizeDefault,
                    fontWeight: FontWeight.bold),
              ),
            ),
            WidgetUtil.getLine(
                margin: EdgeInsets.only(top: SizeUtil.smallSpace), width: 4),
            //todo select service
            ValueListenableBuilder<dynamic>(
              valueListenable: selectedShopServiceController,
              builder: (BuildContext context, dynamic value, Widget child) {
                dynamic selectedService = selectedShopServiceController.value;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 3.3),
                      padding: EdgeInsets.only(
                          left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
                      itemCount:
                          shop['service'] != null ? shop['service'].length : 0,
                      itemBuilder: (context, index) {
                        dynamic service = shop['service'][index];
                        return InkWell(
                            onTap: () {
                              selectedShopServiceController.value = service;
                            },
                            child: ServiceDetailItem(
                              data: shop['service'][index],
                              isSelected: selectedShopServiceController.value !=
                                      null &&
                                  selectedShopServiceController.value['id'] ==
                                      service['id'],
                              onBook: () async {
                                selectedShopServiceController.value = service;
                                var returnValue = await RouteUtil.push(context,
                                    PartnerServiceDetailScreen(data: service));
                                if (returnValue != null) {
                                  selectedDateController.value =
                                      returnValue['date'];
                                  selectedTimeController.value =
                                      returnValue['time'];
                                  onBookingService();
                                }
                              },
                            ));
                      },
                    ),
                    WidgetUtil.getLine(margin: EdgeInsets.all(0), width: 2),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        S.of(context).choose_time,
                        style: TextStyle(
                            color: ColorUtil.textColor,
                            fontSize: SizeUtil.textSizeDefault,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    selectedShopServiceController.value == null
                        ? Center(child: Text(S.of(context).choose_service_title),)
                        : ServiceDatePicker(
                            timeOpen: selectedService['time_open'],
                            selectDateController: selectedDateController,
                            selectTimeController: selectedTimeController,
                          ),
                  ],
                );
              },
            )
          ],
        ),
      ],
    );
  }

  List<dynamic> getPlaces() {
    if (shop == null ||
        shop['place'] == null ||
        !shop['place'].runtimeType.toString().contains('List')) return List();
    return shop['place'];
  }
}
