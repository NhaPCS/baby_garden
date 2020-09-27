import 'dart:convert';

import 'package:baby_garden_flutter/util/resource.dart';

class RemindCalendar {
  String id;
  String productId;
  String dateStart;
  String timeStart;
  String dateEnd;
  String timeEnd;
  RemindType type;
  String period;
  String time1;
  String time2;
  String time3;
  String time4;
  String image;
  String productName;
  String price;
  String datetime;

  RemindCalendar(
      {this.id,
      this.productId,
      this.dateStart,
      this.dateEnd,
      this.timeStart,
      this.timeEnd,
      this.type = RemindType.remindBuy,
      this.period,
      this.time1,
      this.time2,
      this.time3,
      this.time4,
      this.image,
      this.productName,
      this.price,
      this.datetime});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {
      'product_id': this.productId,
      'type': this.type == RemindType.remindBuy
          ? "1"
          : this.type == RemindType.remindUse ? "2" : "3",
    };
    if (dateStart != null) {
      params['date_start'] = DateUtil.convertNormalToServerDate(this.dateStart);
    }
    if (timeStart != null) {
      params['time_start'] = this.timeStart;
    }
    if (dateEnd != null) {
      params['date_end'] = DateUtil.convertNormalToServerDate(this.dateEnd);
    }
    if (timeEnd != null) {
      params['time_end'] = this.timeEnd;
    }
    if (period != null) {
      params['period'] = this.period;
    }
    if (time1 != null) {
      params['time_1'] = this.time1;
    }
    if (time2 != null) {
      params['time_2'] = this.time2;
    }
    if (time3 != null) {
      params['time_3'] = this.time3;
    }
    if (time4 != null) {
      params['time_4'] = this.time4;
    }

    return params;
  }

  RemindCalendar fromJson(Map<String, dynamic> calendar) {
    print('olala  ${calendar}');
    final images = calendar['image'] as List<dynamic>;
    print(images.length);

    id = calendar['id'];
    dateStart = calendar['date_start'];
    timeStart = calendar['time_start'];
    dateEnd = calendar['date_end'];
    timeEnd = calendar['time_end'];
    switch (calendar['type']) {
      case "1":
        type = RemindType.remindBuy;
        break;
      case "2":
        type = RemindType.remindUse;
        break;
      case "3":
        type = RemindType.all;
        break;
    }
    period = calendar['period'];
    time1 = calendar['time_1'];
    time2 = calendar['time_2'];
    time3 = calendar['time_3'];
    time4 = calendar['time_4'];
    datetime = calendar['date'];
    productId = calendar['product_id'] != null ? calendar['product_id'] : '';
    productName =
        calendar['product_name'] != null ? calendar['product_name'] : '';
    price = calendar['price'] != null ? calendar['price'] : '';
    image = images.length > 0 ? images.first : '';

    return this;
  }
}

enum RemindType { remindBuy, remindUse, all }
