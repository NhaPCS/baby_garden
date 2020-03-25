import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_faq.dart';
import 'package:baby_garden_flutter/item/item_order_option.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking/booking_rate_screen.dart';
import 'package:baby_garden_flutter/screen/order/list_order_screen.dart';
import 'package:baby_garden_flutter/screen/order/order_list_screen.dart';
import 'package:baby_garden_flutter/screen/service_and_order_list/service_list_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class OrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderState();
  }
}

class _OrderState extends BaseState<OrderScreen> {
  List<dynamic> ORDER_OPTIONS = List();
  List<dynamic> SERVICE_OPTIONS = List();
  List<String> FAQS = List();

  @override
  Widget buildWidget(BuildContext context) {
    return Column(
      children: <Widget>[
        getAppBar(title: S.of(context).order.toUpperCase(), hasBack: false),
        Expanded(
            child: ListView(
          padding: SizeUtil.smallPadding,
          children: <Widget>[
            Text(
              S.of(context).my_order,
              style: TextStyle(
                  color: ColorUtil.primaryColor, fontWeight: FontWeight.bold),
            ),
            GridView(
              physics: ScrollPhysics(),
              padding: EdgeInsets.only(
                  top: SizeUtil.smallSpace, bottom: SizeUtil.smallSpace),
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              children: ORDER_OPTIONS
                  .map((e) => InkWell(
                        child: ItemOrderOption(option: e),
                        onTap: () {
                          switch(ORDER_OPTIONS.indexOf(e)){
                            case 0:// todo chờ thanh toán
                              push(OrderListScreen(
                                title: e['title'].replaceAll("\n", " "),isShowNegativeButton: true,isShowPositiveButton: true,state: 0,
                              ));
                              break;
                            case 1://todo chờ xác nhận
                              push(OrderListScreen(
                                title: e['title'].replaceAll("\n", " "),isShowNegativeButton: true,state: 1,
                              ));
                              break;
                            case 2://todo nhận hàng tại shop
                              push(OrderListScreen(title: S.of(context).receive_in_shop,state: 2,isShowPositiveButton: true,isShowNegativeButton: true,));
                              break;
                            case 3://todo đang đóng gói
                              push(OrderListScreen(
                                title: e['title'].replaceAll("\n", " "),state: 3,
                              ));
                              break;
                            case 4://todo đang vận chuyển
                              push(OrderListScreen(state: 4,title: S.of(context).delivering,));
                              break;
                            case 5://todo đơn hàng thành công
                              push(OrderListScreen(title: S.of(context).ordered,state: 5,isShowPositiveButton: true,childTitle: "Đơn hàng VCB19.12.25",));
                              break;
                            case 6://todo đơn hàng đã huỷ
                              push(OrderListScreen(title: S.of(context).canceled_order,state: 6,isShowPositiveButton: true,childTitle: "Chi tiết huỷ đơn",));
                              break;
                            default://todo đánh giá đơn hàng
                              push(BookingRateScreen(isService:  false,));
                              break;
                          }

                        },
                      ))
                  .toList(),
            ),
            Text(
              S.of(context).my_service,
              style: TextStyle(
                  color: ColorUtil.primaryColor, fontWeight: FontWeight.bold),
            ),
            GridView(
              padding: EdgeInsets.only(
                  top: SizeUtil.smallSpace, bottom: SizeUtil.smallSpace),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              children: SERVICE_OPTIONS
                  .map((e) => InkWell(
                  onTap: (){
                    switch(SERVICE_OPTIONS.indexOf(e)){
                      case 0 ://todo đã đặt lịch
                        push(ServiceListScreen(title: S.of(context).service_booked,state: 0,childTitle: "Đơn hàng VCB19.12.25",));
                        break;
                      case 1 ://todo đã sử dụng
                        push(ServiceListScreen(title: S.of(context).used_service,state: 1,childTitle:"Đơn hàng VCB19.12.25" ,));
                        break;
                      case 2 :// todo đã huỷ đặt lịch
                        push(ServiceListScreen(title: S.of(context).canceled_service,state: 2,childTitle: "Chi tiết huỷ đơn",));
                        break;
                      default://todo đánh giá dịch vụ
                        push(BookingRateScreen(isService: true,));
                        break;
                    }
                  },
                  child: ItemOrderOption(option: e)))
                  .toList(),
            ),
            Text(
              S.of(context).faq,
              style: TextStyle(
                  color: ColorUtil.primaryColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: FAQS.map((e) => ItemFaq(question: e)).toList(),
            )
          ],
        ))
      ],
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [];
  }

  @override
  void didChangeDependencies() {
    SERVICE_OPTIONS = [
      {
        'icon': 'service_booked',
        'notify_count': 1,
        'title': S.of(context).booked
      },
      {'icon': 'service_used', 'notify_count': 1, 'title': S.of(context).used},
      {
        'icon': 'service_cancelled',
        'notify_count': 1,
        'title': S.of(context).cancelled_book
      },
      {
        'icon': 'order_review',
        'notify_count': 1,
        'title': S.of(context).rate_service
      }
    ];
    ORDER_OPTIONS = [
      {
        'icon': 'order_wait_payment',
        'notify_count': 1,
        'title': S.of(context).waiting_payment
      },
      {
        'icon': 'order_wait_confirm',
        'notify_count': 0,
        'title': S.of(context).waiting_confirm
      },
      {
        'icon': 'order_get_at_shop',
        'notify_count': 3,
        'title': S.of(context).get_at_shop
      },
      {
        'icon': 'order_packaging',
        'notify_count': 0,
        'title': S.of(context).packing
      },
      {
        'icon': 'order_delivering',
        'notify_count': 1,
        'title': S.of(context).transporting
      },
      {
        'icon': 'order_success',
        'notify_count': 1,
        'title': S.of(context).success_order
      },
      {
        'icon': 'order_cancelled',
        'notify_count': 1,
        'title': S.of(context).cancelled_order
      },
      {
        'icon': 'order_review',
        'notify_count': 1,
        'title': S.of(context).rate_order
      }
    ];
    FAQS = [
      S.of(context).how_to_order,
      S.of(context).how_to_know_where_my_order,
      S.of(context).how_to_cancel_order,
      S.of(context).when_order_wrong,
      S.of(context).how_to_contact_with_shop,
    ];
    super.didChangeDependencies();
  }
}
