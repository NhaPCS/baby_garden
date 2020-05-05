class PointDetail {
  String shopImage;
  String history;
  String dateTime;
  int currentPoint;
  int type; // 1 add point, 2 substract point
  int changePoint;

  PointDetail(
      {this.shopImage,
      this.history,
      this.dateTime,
      this.currentPoint,
      this.type,
      this.changePoint});
}
