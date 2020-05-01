class RemindCalendar {
  int calendarId;
  int productId;
  String dateStart;
  String timeStart;
  String dateEnd;
  String timeEnd;
  RemindType type;
  RemindPeriod period;
  String time1;
  String time2;
  String time3;
  String time4;
  String image = "photo/sample_product.png";
  String description =
      "Sữa bột Glico Nhật Bản số 0-1 dành cho trẻ từ sơ sinh đến 1 tuổi";
  String price = "900.000";
  String datetime = "12.01.2020 - 08:00";

  RemindCalendar(
      {this.calendarId,
      this.productId,
      this.dateStart,
      this.dateEnd,
      this.timeStart,
      this.timeEnd,
      this.type,
      this.period,
      this.time1,
      this.time2,
      this.time3,
      this.time4,
      this.image,
      this.description,
      this.price,
      this.datetime});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {
      'product_id': this.productId,
      'date_start': this.dateStart,
      'time_start': this.timeStart,
      'date_end': this.dateEnd,
      'time_end': this.timeEnd,
      'type': this.type == RemindType.remindBuy ? 1 : 2,
      'period': this.period == RemindPeriod.everyday ? 1 : 2,
      'time1': this.time1,
      'time2': this.time2,
      'time3': this.time3,
      'time4': this.time4
    };
    return params;
  }
}

enum RemindType { remindBuy, remindUse }
enum RemindPeriod { everyday, twiceDay }
