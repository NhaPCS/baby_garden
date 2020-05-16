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
        'transportState': TransportState.WAITING_CHECKOUT,
        'type': 8,
      },
      {
        'icon': 'order_wait_confirm',
        'notify_count': 0,
        'transportState': TransportState.WAITING_CONFIRM,
        'type': 1
      },
      {
        'icon': 'order_get_at_shop',
        'notify_count': 0,
        'transportState': TransportState.RECEIVE_IN_SHOP,
        'type': 7
      },
      {
        'icon': 'order_packaging',
        'notify_count': 0,
        'transportState': TransportState.PACKING,
        'type': 5
      },
      {
        'icon': 'order_delivering',
        'notify_count': 0,
        'transportState': TransportState.IN_DELIVERY,
        'type': 6
      },
      {
        'icon': 'order_success',
        'notify_count': 0,
        'transportState': TransportState.SUCCESS,
        'type': 3
      },
      {
        'icon': 'order_cancelled',
        'notify_count': 0,
        'transportState': TransportState.CANCEL,
        'type': 4
      },
      {
        'icon': 'order_review',
        'notify_count': 0,
        'transportState': TransportState.NONE,
        'type': 9
      }
    ];
    getOrdersCount();
  }

  void getOrdersCount() {
    totalCount = 0;
    ORDER_OPTIONS.forEach((element) async {
      dynamic data = await service.listBookingProduct(type: element['type']);
      if (data != null) {
        element['notify_count'] = data.length;
        notifyListeners();
        totalCount += element['notify_count'];
      }
    });

    SERVICE_OPTIONS.forEach((element) async {
      dynamic data = await service.listBookingService(type: element['type']);
      if (data != null) {
        element['notify_count'] = data.length;
        notifyListeners();
        totalCount += element['notify_count'];
      }
    });
  }
}
