class Product {
  String id;
  String shopId;
  String categoryId;
  String name;
  String price;
  String priceDiscount;
  String date;
  String dateView;
  String favoriteDate;
  bool isFavorite;
  List<dynamic> image;
  bool active;

  Product(
      {this.id,
      this.shopId,
      this.categoryId,
      this.name,
      this.price,
      this.date,
      this.isFavorite,
      this.image,
      this.active,
      this.dateView,
      this.priceDiscount,
      this.favoriteDate});
}
