import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/orders_provider.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking_rate/booking_rate_screen.dart';
import 'package:baby_garden_flutter/screen/faq/faq_screen.dart';
import 'package:baby_garden_flutter/screen/order/item/faq_item.dart';
import 'package:baby_garden_flutter/screen/order/item/order_option_item.dart';
import 'package:baby_garden_flutter/screen/order/provider/questions_provider.dart';
import 'package:baby_garden_flutter/screen/order_list/order_list_screen.dart';
import 'package:baby_garden_flutter/screen/service_and_order_list/service_list_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OrderState();
  }
}

class _OrderState extends BaseState<OrderScreen> {
  final QuestionProvider _questionProvider = QuestionProvider();

  @override
  void initState() {
    _questionProvider.getQuestions();
    super.initState();
  }

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
              children:
                  Provider.of<OrdersProvider>(context).ORDER_OPTIONS.map((e) {
                e['title'] = getOrderTitle(e['type']);
                return InkWell(
                  child: OrderOptionItem(option: e),
                  onTap: () {
                    if (Provider.of<UserProvider>(context, listen: false)
                        .isLogin) {
                      if (e['transportState'] == TransportState.NONE.index) {
                        push(BookingRateScreen(
                          isService: false,
                        ));
                      } else {
                        push(OrderListScreen(
                          title: e['title'].replaceAll("\n", " "),
                          state: e['transportState'],
                        ));
                      }
                    } else {
                      WidgetUtil.showRequireLoginDialog(context);
                    }
                  },
                );
              }).toList(),
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
              children:
                  Provider.of<OrdersProvider>(context).SERVICE_OPTIONS.map((e) {
                e['title'] = getServiceTitle(e['type']);
                return InkWell(
                    onTap: () {
                      var provider =
                          Provider.of<UserProvider>(context, listen: false);
                      if (provider.isLogin) {
                        switch (e['type']) {
                          case 1: //todo đã đặt lịch
                            push(ServiceListScreen(
                              title: S.of(context).service_booked,
                              state: 0,
                            ));
                            break;
                          case 2: //todo đã sử dụng
                            push(ServiceListScreen(
                              title: S.of(context).used_service,
                              state: 1,
                            ));
                            break;
                          case 3: // todo đã huỷ đặt lịch
                            push(ServiceListScreen(
                              title: S.of(context).canceled_service,
                              state: 2,
                            ));
                            break;
                          default: //todo đánh giá dịch vụ
                            push(BookingRateScreen(
                              isService: true,
                            ));
                            break;
                        }
                      } else {
                        WidgetUtil.showRequireLoginDialog(context);
                      }
                    },
                    child: OrderOptionItem(option: e));
              }).toList(),
            ),
            Text(
              S.of(context).faq,
              style: TextStyle(
                  color: ColorUtil.primaryColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: SizeUtil.smallSpace,
            ),
            Consumer<QuestionProvider>(
              builder:
                  (BuildContext context, QuestionProvider value, Widget child) {
                if (value.questions == null) return SizedBox();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: value.questions
                      .map((e) => FaqItem(
                            question: e,
                            onItemPressed: () {
                              push(FaqScreen(
                                question: e,
                              ));
                            },
                          ))
                      .toList(),
                );
              },
            )
          ],
        ))
      ],
    );
  }

  String getServiceTitle(int type) {
    switch (type) {
      case 1:
        return S.of(context).booked;
      case 2:
        return S.of(context).used;
      case 3:
        return S.of(context).cancelled_book;
      default:
        return S.of(context).rate_service;
    }
  }

  String getOrderTitle(int type) {
    switch (type) {
      case 8:
        return S.of(context).waiting_payment;
      case 1:
        return S.of(context).waiting_confirm;
      case 7:
        return S.of(context).get_at_shop;
      case 5:
        return S.of(context).packing;
      case 6:
        return S.of(context).transporting;
      case 3:
        return S.of(context).success_order;
      case 4:
        return S.of(context).cancelled_order;
      default:
        return S.of(context).rate_order;
    }
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _questionProvider)];
  }
}
