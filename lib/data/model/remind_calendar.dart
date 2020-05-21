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
      this.productId = '',
      this.dateStart = '',
      this.dateEnd = '',
      this.timeStart = '',
      this.timeEnd = '',
      this.type = RemindType.remindBuy,
      this.period = '',
      this.time1 = '',
      this.time2 = '',
      this.time3 = '',
      this.time4 = '',
      this.image = '',
      this.productName = '',
      this.price = '',
      this.datetime = ''});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> params = {
      'product_id': this.productId,
      'date_start': this.dateStart,
      'time_start': this.timeStart,
      'date_end': this.dateEnd,
      'time_end': this.timeEnd,
      'type': this.type == RemindType.remindBuy ? "1" : "2",
      'period': this.period,
      'time1': this.time1,
      'time2': this.time2,
      'time3': this.time3,
      'time4': this.time4
    };
    return params;
  }

  RemindCalendar fromJson(Map<String, dynamic> calendar) {
    id = calendar['id'];
    dateStart = calendar['date_start'];
    timeStart = calendar['time_start'];
    dateEnd = calendar['date_end'];
    timeEnd = calendar['time_end'];
    type =
        calendar['type'] == "1" ? RemindType.remindBuy : RemindType.remindUse;
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
    image = [null, []].contains(calendar['image'])
        ? calendar['image'][0]
        : "photo/sample_product.png";

    return this;
  }
}

enum RemindType { remindBuy, remindUse }
