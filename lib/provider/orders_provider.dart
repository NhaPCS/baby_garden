import 'package:baby_garden_flutter/data/service.dart' as service;
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class OrdersProvider extends ChangeNotifier {
  List<dynamic> SERVICE_OPTIONS = [];
  List<dynamic> ORDER_OPTIONS = [];
  int totalCount = 0;

  void init() {
    SERVICE_OPTIONS = [
      {'icon': 'service_booked', 'notify_count': 0, 'type': 1},
      {'icon': 'service_used', 'notify_count': 1, 'type': 2},
      {'icon': 'service_cancelled', 'notify_count': 0, 'type': 3},
      {'icon': 'order_review', 'notify_count': 0, 'type': 0}
    ];
    ORDER_OPTIONS = [
      {
        'icon': 'order_wait_payment',
        'notify_count': 0,
        'transportState': TransportState.WAITING_CHECKOUT.index,
        'type': 8,
      },
      {
        'icon': 'order_wait_confirm',
        'notify_count': 0,
        'transportState': TransportState.WAITING_CONFIRM.index,
        'type': 1
      },
      {
        'icon': 'order_get_at_shop',
        'notify_count': 0,
        'transportState': TransportState.RECEIVE_IN_SHOP.index,
        'type': 7
      },
      {
        'icon': 'order_packaging',
        'notify_count': 0,
        'transportState': TransportState.PACKING.index,
        'type': 5
      },
      {
        'icon': 'order_delivering',
        'notify_count': 0,
        'transportState': TransportState.IN_DELIVERY.index,
        'type': 6
      },
      {
        'icon': 'order_success',
        'notify_count': 0,
        'transportState': TransportState.SUCCESS.index,
        'type': 3
      },
      {
        'icon': 'order_cancelled',
        'notify_count': 0,
        'transportState': TransportState.CANCEL.index,
        'type': 4
      },
      {
        'icon': 'order_review',
        'notify_count': 0,
        'transportState': TransportState.NONE.index,
        'type': 0
      }
    ];
    getOrdersCount();
  }

  Future<void> getOrdersCount() async {
    totalCount = 0;
    dynamic data = await service.numberBooking();
    if (data != null) {
      ORDER_OPTIONS.forEach((element) {
        switch (element['type']) {
          case 8:
            element['notify_count'] = getCount(data, 'chothanhtoan');
            break;
          case 1:
            element['notify_count'] = getCount(data, 'choxacnhan');
            break;
          case 7:
            element['notify_count'] = getCount(data, 'nhanhangtaishop');
            break;
          case 5:
            element['notify_count'] = getCount(data, 'dangdonggoi');
            break;
          case 6:
            element['notify_count'] = getCount(data, 'dangvanchuyen');
            break;
          case 3:
            element['notify_count'] = getCount(data, 'thanhcong');
            break;
          case 4:
            element['notify_count'] = getCount(data, 'huydonhang');
            break;
          case 0:
            element['notify_count'] = getCount(data, 'danhgiadonhang');
            break;
        }
      });
      SERVICE_OPTIONS.forEach((element) {
        switch (element['type']) {
          case 1:
            element['notify_count'] = getCount(data, 'dadatlich');
            break;
          case 2:
            element['notify_count'] = getCount(data, 'dasudung');
            break;
          case 3:
            element['notify_count'] = getCount(data, 'huylich');
            break;
          case 0:
            element['notify_count'] = getCount(data, 'danhgiadichvu');
            break;
        }
      });
      notifyListeners();
    }
  }

  int getCount(dynamic data, String key) {
    if (data != null && data[key] != null) {
      int count = data[key];
      if (!ignoreKeys.contains(key)) {
        totalCount += count;
      }

      return count;
    }
    return 0;
  }

  final List<String> ignoreKeys = [
    'thanhcong',
    'huydonhang',
    'danhgiadonhang',
    'huylich',
    'danhgiadichvu'
  ];
}
