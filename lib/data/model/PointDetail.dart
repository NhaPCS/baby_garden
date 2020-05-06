class PointDetail {
  String shopImage;
  String history;
  String dateTime;
  String currentPoint;
  String type; // 1 add point, 2 substract point
  String changePoint;

  PointDetail(
      {this.shopImage,
      this.history,
      this.dateTime,
      this.currentPoint,
      this.type,
      this.changePoint});
}
